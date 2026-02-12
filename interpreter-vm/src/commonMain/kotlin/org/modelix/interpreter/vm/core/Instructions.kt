package org.modelix.interpreter.vm.core

class CallInstruction(
    val entryPoint: Instruction,
    val parameterCount: Int,
) : Instruction() {
    override fun execute(state: VMState): VMState {
        var newFrame = StackFrame(returnTo = next)
        var newState = state
        for (i in 0 until parameterCount) {
            newState.popOperand().let {
                newState = it.second
                newFrame = newFrame.writeLocalMemory(ParameterKey<Any?>(i), it.first)
            }
        }
        newState = newState.copy(callStack = newState.callStack.pushFrame(newFrame), nextInstruction = entryPoint)
        return newState
    }
}

class ReturnInstruction : Instruction() {
    override fun execute(state: VMState): VMState {
        val (newCallStack, currentFrame) = state.callStack.popFrame()
        check(currentFrame.operandStack.size == 1) { "Operand stack should contain a single value, but was: " + currentFrame.operandStack }
        return state
            .copy(nextInstruction = currentFrame.returnTo, callStack = newCallStack)
            .pushOperand(currentFrame.operandStack.single())
    }
}

class PushConstantInstruction<E>(
    val value: E,
) : Instruction() {
    override fun execute(state: VMState): VMState = state.pushOperand(value)
}

class StoreInstruction<E>(
    val target: MemoryKey<in E>,
) : Instruction() {
    override fun execute(state: VMState): VMState = state.popOperand().let { (value, newState) -> newState.writeMemory(target, value as E) }
}

class LoadInstruction<E>(
    val source: MemoryKey<out E>,
) : Instruction() {
    override fun execute(state: VMState): VMState = state.pushOperand(state.readMemory(source))
}

abstract class BinaryOperationInstruction<Arg1, Arg2, Result> : Instruction() {
    abstract fun apply(
        arg1: Arg1,
        arg2: Arg2,
    ): Result

    override fun execute(state: VMState): VMState {
        var newState: VMState = state
        var arg1: Arg1
        var arg2: Arg2
        newState.popOperand().let {
            arg2 = it.first as Arg2
            newState = it.second
        }
        newState.popOperand().let {
            arg1 = it.first as Arg1
            newState = it.second
        }
        newState = newState.pushOperand(apply(arg1, arg2))
        return newState
    }
}

class AddIntegersInstruction : BinaryOperationInstruction<Int, Int, Int>() {
    override fun apply(
        arg1: Int,
        arg2: Int,
    ): Int = arg1 + arg2
}

class MultiplyIntegersInstruction : BinaryOperationInstruction<Int, Int, Int>() {
    override fun apply(
        arg1: Int,
        arg2: Int,
    ): Int = arg1 * arg2
}

class JumpInstruction(
    val target: Instruction,
) : Instruction() {
    override fun execute(state: VMState): VMState = state.copy(nextInstruction = target)
}

class ConditionalJumpInstruction(
    val condition: MemoryKey<out Boolean>,
    val target: Instruction,
) : Instruction() {
    override fun execute(state: VMState): VMState = if (state.readMemory(condition)) state.copy(nextInstruction = target) else state
}

class MoveInstruction<E>(
    val source: MemoryKey<out E>,
    val target: MemoryKey<in E>,
) : Instruction() {
    override fun execute(state: VMState): VMState = state.writeMemory(target, state.readMemory(source))
}

class NoOpInstruction : Instruction() {
    override fun execute(state: VMState): VMState = state
}

data class NamedGlobalVarKey<E>(
    val name: String,
) : MemoryKey<E>(MemoryType.GLOBAL, name)

data class NamedLocalVarKey<E>(
    val name: String,
) : MemoryKey<E>(MemoryType.LOCAL, name)

data class ParameterKey<E>(
    val index: Int,
) : MemoryKey<E>(MemoryType.LOCAL, "parameter" + index)

data class ReturnValueKey<E>(
    val index: Int,
) : MemoryKey<E>(MemoryType.LOCAL, "returnValue" + index)
