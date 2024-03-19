package org.modelix.editor.kernelf

import kotlinx.browser.document
import kotlinx.html.dom.create
import kotlinx.html.js.div
import org.iets3.core.expr.tests.N_AssertTestItem
import org.iets3.core.expr.tests.N_TestSuite
import org.modelix.editor.CaretSelection
import org.modelix.editor.EditorEngine
import org.modelix.editor.GeneratedHtmlMap
import org.modelix.editor.IncrementalBranch
import org.modelix.editor.IncrementalVirtualDOMBuilder
import org.modelix.editor.JSDom
import org.modelix.editor.JSKeyboardEvent
import org.modelix.editor.JSKeyboardEventType
import org.modelix.editor.JsEditorComponent
import org.modelix.editor.KnownKeys
import org.modelix.editor.firstLeaf
import org.modelix.editor.isVisible
import org.modelix.editor.layoutable
import org.modelix.editor.nextLeafs
import org.modelix.editor.resolveNodeCell
import org.modelix.editor.toHtml
import org.modelix.editor.unwrap
import org.modelix.incremental.IncrementalEngine
import org.modelix.kernelf.KernelfLanguages
import org.modelix.metamodel.ModelData
import org.modelix.metamodel.descendants
import org.modelix.metamodel.ofType
import org.modelix.metamodel.untyped
import org.modelix.model.ModelFacade
import org.modelix.model.api.IBranch
import org.modelix.model.api.PBranch
import org.modelix.model.area.getArea
import org.modelix.model.client.IdGenerator
import org.modelix.model.repositoryconcepts.N_Module
import org.modelix.model.repositoryconcepts.models
import org.modelix.model.repositoryconcepts.rootNodes
import kotlin.test.AfterTest
import kotlin.test.BeforeTest
import kotlin.test.Ignore
import kotlin.test.Test
import kotlin.test.assertEquals

open class IncrementalLayoutAfterInsertJS {
    lateinit var assertTestItem: N_AssertTestItem
    lateinit var editor: JsEditorComponent
    lateinit var branch: IBranch
    lateinit var testSuite: N_TestSuite

    @BeforeTest
    fun beforeTest() {
        KernelfLanguages.registerAll()
        branch = IncrementalBranch(PBranch(ModelFacade.newLocalTree(), IdGenerator.getInstance(56754)))
        ModelData.fromJson(modelJson).load(branch)

        val engine = EditorEngine(IncrementalEngine())
        KernelfEditor.register(engine)
        testSuite = branch.computeRead { branch.getArea().getRoot().allChildren.ofType<N_Module>().models.rootNodes.ofType<N_TestSuite>().first() }
        editor = JsEditorComponent(engine, branch.getArea(), { editorState -> branch.computeRead { engine.createCell(editorState, testSuite.untyped()) } })
        assertTestItem = branch.computeRead { testSuite.descendants<N_AssertTestItem>().drop(1).first() }
        editor.selectAfterUpdate {
            val cell = editor.resolveNodeCell(assertTestItem)!!.firstLeaf().nextLeafs(true).first { it.isVisible() }
            println(cell.toString())
            CaretSelection(cell.layoutable()!!, 0)
        }
        editor.update()
    }

    @AfterTest
    fun afterTest() {
        KernelfLanguages.languages.forEach { it.unregister() }
    }

    @Ignore
    @Test
    fun domAfterInsert() {
        val containerElement = document.create.div()
        val generatedHtmlMap = GeneratedHtmlMap()
        var consumer = JSDom(containerElement.ownerDocument!!).let { vdom -> IncrementalVirtualDOMBuilder(vdom, vdom.wrap(containerElement), generatedHtmlMap) }
        val initialHtml = editor.getRootCell().layout.toHtml(consumer).unwrap().outerHTML

        editor.processKeyEvent(JSKeyboardEvent(JSKeyboardEventType.KEYDOWN, KnownKeys.Enter))
        consumer = JSDom(containerElement.ownerDocument!!).let { vdom -> IncrementalVirtualDOMBuilder(vdom, vdom.wrap(containerElement), generatedHtmlMap) }
        val incrementalHtml = editor.getRootCell().layout.toHtml(consumer).unwrap().outerHTML

        editor.clearLayoutCache()

        consumer = JSDom(containerElement.ownerDocument!!).let { vdom -> IncrementalVirtualDOMBuilder(vdom, vdom.wrap(containerElement), generatedHtmlMap) }
        val nonIncrementalHtml = editor.getRootCell().layout.toHtml(consumer).unwrap().outerHTML
        assertEquals(nonIncrementalHtml, incrementalHtml)
    }
}
