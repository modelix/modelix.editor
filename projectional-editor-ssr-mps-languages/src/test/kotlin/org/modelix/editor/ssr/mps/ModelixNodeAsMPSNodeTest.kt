package org.modelix.editor.ssr.mps

import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations
import jetbrains.mps.scope.Scope
import jetbrains.mps.smodel.SNodePointer
import jetbrains.mps.smodel.adapter.structure.MetaAdapterFactory
import jetbrains.mps.smodel.adapter.structure.link.InvalidContainmentLink
import org.jetbrains.mps.openapi.language.SReferenceLink
import org.jetbrains.mps.openapi.model.ResolveInfo
import org.jetbrains.mps.openapi.model.SNode
import org.jetbrains.mps.openapi.persistence.PersistenceFacade
import org.modelix.model.api.ConceptReference
import org.modelix.model.api.IChildLinkReference
import org.modelix.model.api.IWritableNode
import org.modelix.model.data.NodeData
import org.modelix.model.data.NodeDataAsNode
import org.modelix.model.mpsadapters.MPSChildLink
import org.modelix.model.mpsadapters.MPSWritableNode
import org.modelix.model.mpsadapters.tomps.ModelixNodeAsMPSNode

/**
 * The parts of [ModelixNodeAsMPSNode] that MPS code reaches beyond reading the model: user objects and the ways of
 * setting a reference other than to a node, references whose target cannot be resolved, and the role of attributes.
 */
@Suppress("ktlint:standard:function-naming")
class ModelixNodeAsMPSNodeTest : TestBase("SimpleProject") {
    private lateinit var classNode: MPSWritableNode

    override fun setUp() {
        super.setUp()
        readAction {
            val solution = mpsProject.projectModules.first { it.moduleName == "Solution1" }
            classNode =
                MPSWritableNode(
                    solution.models
                        .first()
                        .rootNodes
                        .first()
                )
        }
    }

    private fun wrap(node: IWritableNode): SNode = ModelixNodeAsMPSNode.toMPSNode(node)

    private val rawClass: SNode get() = classNode.node

    /**
     * A `Class1 x;` in the body of the first method, whose `ClassifierType` has no target yet.
     */
    private fun newClassifierType(): MPSWritableNode {
        val method = classNode.getAllChildren().first { it.getContainmentLink().getSimpleName() == "member" }
        val body = method.getAllChildren().first { it.getContainmentLink().getSimpleName() == "body" }
        return body
            .addNewChild(IChildLinkReference.fromName("statement"), -1, ConceptReference(BL + "1068581242864"))
            .addNewChild(IChildLinkReference.fromName("localVariableDeclaration"), -1, ConceptReference(BL + "1068581242863"))
            .addNewChild(IChildLinkReference.fromName("type"), -1, ConceptReference(BL + "1107535904670")) as MPSWritableNode
    }

    private fun classifierLink(type: MPSWritableNode): SReferenceLink =
        type.node.concept.referenceLinks
            .first { it.name == "classifier" }

    /**
     * A pointer into the model of the class to a node that is not there.
     */
    private fun missingNode() = SNodePointer(rawClass.model!!.reference, PersistenceFacade.getInstance().createNodeId("1234567"))

    fun `test user objects are kept on the MPS node`() {
        readAction {
            val wrapper = wrap(classNode)
            wrapper.putUserObject("key", "value")
            assertEquals("value", wrapper.getUserObject("key"))
            assertEquals("value", rawClass.getUserObject("key"))
            assertTrue(wrapper.userObjectKeys.contains("key"))

            wrapper.putUserObject("key", null)
            assertNull(rawClass.getUserObject("key"))
        }
    }

    fun `test a reference is set to a node reference`() {
        writeAction {
            val type = newClassifierType()
            wrap(type).setReference(classifierLink(type), rawClass.reference)
            assertSame(rawClass, type.node.getReferenceTarget(classifierLink(type)))
        }
    }

    fun `test a reference of another node is set as what it points to`() {
        writeAction {
            val source = newClassifierType()
            source.node.setReferenceTarget(classifierLink(source), rawClass)
            val type = newClassifierType()
            wrap(type).setReference(classifierLink(type), wrap(source).getReference(classifierLink(source)))
            assertSame(rawClass, type.node.getReferenceTarget(classifierLink(type)))
        }
    }

    /**
     * The node of the resolve info may be a wrapper, but what ends up in the MPS node has to be the MPS node.
     */
    fun `test a resolve info with a wrapped node stores the MPS node`() {
        writeAction {
            val type = newClassifierType()
            wrap(type).setReference(classifierLink(type), ResolveInfo.of(wrap(classNode)))
            assertSame(rawClass, type.node.getReferenceTarget(classifierLink(type)))
        }
    }

    /**
     * MPS finds a broken reference as one that exists but has no target, and writes it with its resolve info.
     */
    fun `test a reference that cannot be resolved still exists and says where it points to`() {
        writeAction {
            val type = newClassifierType()
            val wrapper = wrap(type)
            wrapper.setReference(classifierLink(type), ResolveInfo.of(missingNode(), "Missing"))

            val reference = checkNotNull(wrapper.getReference(classifierLink(type))) { "The broken reference is gone" }
            assertNull(reference.targetNode)
            assertEquals(missingNode(), reference.targetNodeReference)
            assertEquals("Missing", (reference as jetbrains.mps.smodel.SReference).resolveInfo)
            assertEquals(1, wrapper.references.count())
        }
    }

    fun `test a dropped reference is gone`() {
        writeAction {
            val type = newClassifierType()
            val wrapper = wrap(type)
            wrapper.setReference(classifierLink(type), rawClass.reference)
            wrapper.setReference(classifierLink(type), null as org.jetbrains.mps.openapi.model.SReference?)
            assertNull(wrapper.getReference(classifierLink(type)))
        }
    }

    /**
     * A statement in the body of the first method with a `SuppressErrorsAnnotation` attached to it.
     */
    private fun newAttributedStatement(): Pair<MPSWritableNode, MPSWritableNode> {
        val method = classNode.getAllChildren().first { it.getContainmentLink().getSimpleName() == "member" }
        val body = method.getAllChildren().first { it.getContainmentLink().getSimpleName() == "body" }
        val statement =
            body.addNewChild(IChildLinkReference.fromName("statement"), -1, ConceptReference(BL + "1068581242864")) as MPSWritableNode
        val attribute =
            statement.addNewChild(
                MPSChildLink(SMODEL_ATTRIBUTE).toReference(),
                -1,
                ConceptReference(CORE + "4222318806802425298"),
            ) as MPSWritableNode
        return statement to attribute
    }

    fun `test an attribute is in the attribute role`() {
        writeAction {
            val (_, attribute) = newAttributedStatement()
            assertEquals(SMODEL_ATTRIBUTE, wrap(attribute).containmentLink)
            assertTrue(SNodeOperations.isAttribute(wrap(attribute)))
        }
    }

    /**
     * MPS walks up the ancestors of a node through its attributes. The walk only goes on from an attribute to the
     * parent of the attributed node if it recognizes the attribute as one, and otherwise goes back and forth forever.
     */
    fun `test the scope walk goes from an attribute to the parent of the attributed node`() {
        writeAction {
            val (statement, attribute) = newAttributedStatement()
            assertEquals(wrap(attribute), Scope.parent(wrap(statement)))
            assertEquals(wrap(statement).parent, Scope.parent(wrap(attribute)))
        }
    }

    fun `test the siblings of an attribute are the other children in its role`() {
        writeAction {
            val (_, attribute) = newAttributedStatement()
            assertEquals(listOf(wrap(attribute)), SNodeOperations.getAllSiblings(wrap(attribute), true))
        }
    }

    /**
     * A child always has a containment link, even if its role can't be turned into an MPS link.
     */
    fun `test a role that is no MPS link is an invalid link with its name`() {
        val parent =
            NodeDataAsNode(
                NodeData(id = "parent", children = listOf(NodeData(id = "child", role = "notAnMPSLink"))),
                null,
            )
        val link = checkNotNull(wrap(parent.getAllChildren().single()).containmentLink) { "A child without a role" }
        assertEquals(InvalidContainmentLink(null, "notAnMPSLink"), link)
        assertEquals("notAnMPSLink", link.name)
    }

    companion object {
        private const val BL = "mps:f3061a53-9226-4cc5-a443-f952ceaf5816/"
        private const val CORE = "mps:ceab5195-25ea-4f22-9b92-103b95ca8c0c/"
        private val SMODEL_ATTRIBUTE =
            MetaAdapterFactory.getContainmentLink(
                0xceab519525ea4f22uL.toLong(),
                0x9b92103b95ca8c0cuL.toLong(),
                0x10802efe25aL,
                0x47bf8397520e5942L,
                "smodelAttribute",
            )
    }
}
