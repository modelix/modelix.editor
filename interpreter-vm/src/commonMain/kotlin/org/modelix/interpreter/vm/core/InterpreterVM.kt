package org.modelix.interpreter.vm.core

import kotlinx.collections.immutable.ImmutableList
import kotlinx.collections.immutable.ImmutableMap
import kotlinx.collections.immutable.PersistentList
import kotlinx.collections.immutable.PersistentMap
import kotlinx.collections.immutable.persistentHashMapOf
import kotlinx.collections.immutable.persistentListOf
import kotlinx.collections.immutable.plus
import org.modelix.incremental.AtomicLong

class InterpreterVM(
    entryPoint: Instruction,
) {
    private var state: VMState = VMState(nextInstruction = entryPoint)

    fun isTerminated() = state.nextInstruction == null

    fun run(): VMState {
        while (!isTerminated()) {
            singleStep()
        }
        return state
    }

    fun singleStep(): VMState {
        val instruction = checkNotNull(state.nextInstruction) { "No more instructions to execute" }
        return instruction.execute(state.copy(nextInstruction = instruction.next)).also { state = it }
    }

    fun <T> writeMemory(
        key: MemoryKey<in T>,
        value: T,
    ) {
        state = state.writeMemory(key, value)
    }
}

data class VMState(
    val nextInstruction: Instruction?,
    val globalMemory: Memory = Memory(),
    val callStack: CallStack = CallStack().pushFrame(StackFrame(returnTo = null)),
) {
    fun <T> readMemory(key: MemoryKey<out T>): T = key.memoryType.getMemory(this).read(key)

    fun <T> writeMemory(
        key: MemoryKey<in T>,
        value: T,
    ): VMState = key.memoryType.setMemory(this, key.memoryType.getMemory(this).write(key, value))

    fun updateCurrentFrame(body: (StackFrame) -> StackFrame): VMState = replaceCurrentFrame(body(callStack.currentFrame()))

    fun replaceCurrentFrame(newFrame: StackFrame): VMState = copy(callStack = callStack.updateCurrentFrame(newFrame))

    fun pushOperand(value: Any?): VMState = updateCurrentFrame { it.pushOperand(value) }

    fun popOperand(): Pair<Any?, VMState> =
        callStack.currentFrame().popOperand().let { (value, newFrame) -> value to replaceCurrentFrame(newFrame) }
}

data class Memory(
    private val data: PersistentMap<MemoryKey<*>, Any?> = persistentHashMapOf(),
) {
    fun hasKey(key: MemoryKey<*>): Boolean = data.containsKey(key)

    fun <T> read(key: MemoryKey<out T>): T {
        check(hasKey(key)) { "Uninitialized read: $key" }
        return data[key] as T
    }

    fun <T> write(
        key: MemoryKey<in T>,
        value: T,
    ): Memory = Memory(data.put(key, value))

    fun getEntries(): ImmutableMap<MemoryKey<*>, Any?> = data
}

private val variableIdSequence = AtomicLong()

open class MemoryKey<E>(
    val memoryType: MemoryType,
    val description: String = "var" + variableIdSequence.incrementAndGet(),
) {
    override fun toString() = description
}

abstract class MemoryType {
    abstract fun getMemory(state: VMState): Memory

    abstract fun setMemory(
        state: VMState,
        memory: Memory,
    ): VMState

    companion object {
        val GLOBAL: MemoryType =
            object : MemoryType() {
                override fun getMemory(state: VMState): Memory = state.globalMemory

                override fun setMemory(
                    state: VMState,
                    memory: Memory,
                ): VMState = state.copy(globalMemory = memory)
            }
        val LOCAL: MemoryType =
            object : MemoryType() {
                override fun getMemory(state: VMState): Memory = state.callStack.currentFrame().localMemory

                override fun setMemory(
                    state: VMState,
                    memory: Memory,
                ): VMState =
                    state.copy(callStack = state.callStack.updateCurrentFrame(state.callStack.currentFrame().copy(localMemory = memory)))
            }
    }
}

data class CallStack(
    val frames: PersistentList<StackFrame> = persistentListOf(),
) {
    fun pushFrame(frame: StackFrame) = CallStack(frames + frame)

    fun popFrame(): Pair<CallStack, StackFrame> = CallStack(frames.removeAt(frames.lastIndex)) to frames.last()

    fun currentFrame() = frames.last()

    fun updateCurrentFrame(newFrame: StackFrame) = CallStack(frames.set(frames.lastIndex, newFrame))

    fun getFrames(): ImmutableList<StackFrame> = frames

    fun size() = frames.size
}

data class StackFrame(
    val returnTo: Instruction?,
    val localMemory: Memory = Memory(),
    val operandStack: PersistentList<Any?> = persistentListOf(),
) {
    fun <T> writeLocalMemory(
        key: MemoryKey<T>,
        value: T,
    ): StackFrame = copy(localMemory = localMemory.write(key, value))

    fun pushOperand(value: Any?): StackFrame = copy(operandStack = operandStack.add(value))

    fun popOperand(): Pair<Any?, StackFrame> = operandStack.last() to copy(operandStack = operandStack.removeAt(operandStack.lastIndex))
}

abstract class Instruction {
    var next: Instruction? = null

    abstract fun execute(state: VMState): VMState
}
