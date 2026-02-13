package org.modelix.interpreter.vm.core

import kotlin.reflect.KProperty

class ProgramBuilder {
    private val functions: MutableMap<Any, FunctionBuilder> = HashMap()

    fun getFunction(key: Any): FunctionBuilder = checkNotNull(functions[key]) { "Function doesn't exist: $key" }

    fun getOrBuildFunction(
        key: Any,
        body: FunctionBuilder.() -> Unit,
    ): FunctionBuilder = functions[key] ?: buildFunction(key, body)

    fun buildFunction(
        key: Any,
        body: FunctionBuilder.() -> Unit,
    ): FunctionBuilder {
        check(functions[key] == null) { "Function already exists: $key" }
        val builder = FunctionBuilder()
        functions[key] = builder
        body(builder)
        return builder
    }

    fun <T> variable(type: MemoryType = MemoryType.LOCAL) = O<T>(type)
}

class O<T>(
    private val type: MemoryType,
) {
    private var instance: MemoryKey<T>? = null

    operator fun getValue(
        thisRef: Nothing?,
        property: KProperty<*>,
    ): MemoryKey<T> =
        instance ?: MemoryKey<T>(type, property.name).also {
            instance = it
        }
}

class FunctionBuilder {
    private var firstInstruction: Instruction? = null
    private var lastInstruction: Instruction? = null

    fun addInstruction(instruction: Instruction) {
        lastInstruction?.next = instruction
        lastInstruction = instruction
        if (firstInstruction == null) {
            firstInstruction = instruction
        }
    }

    fun getEntryPoint(): Instruction = firstInstruction ?: NoOpInstruction().also { firstInstruction = it }

    fun <T> load(
        value: T,
        variable: MemoryKey<T>,
    ) {
        addInstruction(PushConstantInstruction(value))
        addInstruction(StoreInstruction(variable))
    }
}
