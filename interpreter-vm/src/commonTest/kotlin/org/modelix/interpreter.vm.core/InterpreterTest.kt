package org.modelix.interpreter.vm.core

import kotlin.test.Test
import kotlin.test.assertEquals

class InterpreterTest {
    @Test
    fun addition() {
        val c = MemoryKey<Int>(MemoryType.GLOBAL, "c")

        val entryPoint =
            ProgramBuilder()
                .buildFunction("main") {
                    addInstruction(PushConstantInstruction(10))
                    addInstruction(PushConstantInstruction(20))
                    addInstruction(AddIntegersInstruction())
                    addInstruction(StoreInstruction(c))
                }.getEntryPoint()

        val finalState = InterpreterVM(entryPoint).run()
        val computationResult = finalState.readMemory(c)

        assertEquals(10 + 20, computationResult)
    }

    @Test
    fun additionOnProgramParameters() {
        val a = ParameterKey<Int>(0)
        val b = ParameterKey<Int>(1)
        val c = MemoryKey<Int>(MemoryType.GLOBAL, "c")

        val entryPoint =
            ProgramBuilder()
                .buildFunction("main") {
                    addInstruction(LoadInstruction(ParameterKey<Int>(1)))
                    addInstruction(LoadInstruction(ParameterKey<Int>(0)))
                    addInstruction(AddIntegersInstruction())
                    addInstruction(StoreInstruction<Int>(c))
                }.getEntryPoint()

        val vm = InterpreterVM(entryPoint)
        vm.writeMemory(a, 10)
        vm.writeMemory(b, 20)
        val finalState = vm.run()
        val computationResult = finalState.readMemory(c)

        assertEquals(10 + 20, computationResult)
    }

    @Test
    fun functionCall() {
        val entryPoint =
            ProgramBuilder().run {
                val plusFunction =
                    buildFunction("plus") {
                        addInstruction(LoadInstruction(ParameterKey<Int>(0)))
                        addInstruction(LoadInstruction(ParameterKey<Int>(1)))
                        addInstruction(AddIntegersInstruction())
                        addInstruction(ReturnInstruction())
                    }
                val mulFunction =
                    buildFunction("mul") {
                        addInstruction(LoadInstruction(ParameterKey<Int>(0)))
                        addInstruction(LoadInstruction(ParameterKey<Int>(1)))
                        addInstruction(MultiplyIntegersInstruction())
                        addInstruction(ReturnInstruction())
                    }
                buildFunction("main") {
                    addInstruction(PushConstantInstruction(31))
                    addInstruction(PushConstantInstruction(13))
                    addInstruction(PushConstantInstruction(7))
                    addInstruction(CallInstruction(plusFunction.getEntryPoint(), 2))
                    addInstruction(CallInstruction(mulFunction.getEntryPoint(), 2))
                    addInstruction(StoreInstruction<Int>(NamedGlobalVarKey<Int>("finalResult")))
                }.getEntryPoint()
            }

        val vm = InterpreterVM(entryPoint)
        val finalState = vm.run()
        val computationResult = finalState.readMemory(NamedGlobalVarKey<Int>("finalResult"))

        assertEquals((7 + 13) * 31, computationResult)
    }
}
