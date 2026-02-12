package org.modelix.editor

import org.modelix.metamodel.IPropertyValueSerializer
import org.modelix.metamodel.ITypedProperty
import org.modelix.metamodel.MandatoryBooleanPropertySerializer
import org.modelix.metamodel.MandatoryIntPropertySerializer
import org.modelix.metamodel.OptionalBooleanPropertySerializer
import org.modelix.metamodel.OptionalIntPropertySerializer
import org.modelix.metamodel.getTypedPropertyValue
import org.modelix.metamodel.setTypedPropertyValue
import org.modelix.model.api.INode
import org.modelix.model.api.IProperty

fun INode.getBooleanPropertyValue(property: IProperty): Boolean =
    getTypedPropertyValue(TypedPropertyAdapter(property, MandatoryBooleanPropertySerializer))

fun INode.setBooleanPropertyValue(
    property: IProperty,
    value: Boolean?,
) = setTypedPropertyValue(TypedPropertyAdapter(property, OptionalBooleanPropertySerializer), value)

fun INode.getIntPropertyValue(property: IProperty): Int =
    getTypedPropertyValue(TypedPropertyAdapter(property, MandatoryIntPropertySerializer))

fun INode.setIntPropertyValue(
    property: IProperty,
    value: Int?,
) = setTypedPropertyValue(TypedPropertyAdapter(property, OptionalIntPropertySerializer), value)

class TypedPropertyAdapter<ValueT>(
    private val untypedProperty: IProperty,
    val serializer: IPropertyValueSerializer<ValueT>,
) : ITypedProperty<ValueT> {
    override fun untyped() = untypedProperty

    override fun serializeValue(value: ValueT) = serializer.serialize(value)

    override fun deserializeValue(serialized: String?) = serializer.deserialize(serialized)
}
