import Foundation

// 3.1

class MultiStack {
    enum Section: Int, CaseIterable {
        case first
        case second
        case third
    }

    var description: String { storage.description }

    private let stackSize: Int
    private var storage: [Int]
    private var lastIndex = [Int]()

    init(stackSize: Int) {
        self.stackSize = stackSize

        storage = Array(repeating: 0, count: stackSize * Section.allCases.count)

        for i in 0..<Section.allCases.count {
            lastIndex.append(i * stackSize)
        }
    }

    func push(_ value: Int, to stack: Section) {
        guard !isFull(stack) else {
            return
        }

        storage[lastIndex[stack.rawValue]] = value
        lastIndex[stack.rawValue] += 1
    }

    func pop(from stack: Section) -> Int? {
        guard !isEmpty(stack) else {
            return nil
        }

        let last = lastIndex[stack.rawValue]
        let value = storage[last - 1]
        lastIndex[stack.rawValue] -= 1
        return value
    }

    private func isFull(_ stack: Section) -> Bool {
        let first = stack.rawValue * stackSize
        let last = first + stackSize
        return lastIndex[stack.rawValue] == last
    }

    private func isEmpty(_ stack: Section) -> Bool {
        let first = stack.rawValue * stackSize
        return lastIndex[stack.rawValue] == first
    }
}

//let multiStack = MultiStack(stackSize: 3)
//multiStack.push(1, to: .first)
//multiStack.push(2, to: .first)
//multiStack.push(3, to: .first)
//multiStack.push(1, to: .second)
//multiStack.push(2, to: .second)
//multiStack.push(3, to: .second)
//multiStack.push(1, to: .third)
//multiStack.push(2, to: .third)
//multiStack.push(3, to: .third)
//print(multiStack.description)
//print(multiStack.pop(from: .first) ?? "nil")
//print(multiStack.pop(from: .second) ?? "nil")
//print(multiStack.pop(from: .first) ?? "nil")
//print(multiStack.pop(from: .second) ?? "nil")
//print(multiStack.pop(from: .first) ?? "nil")
//print(multiStack.pop(from: .first) ?? "nil")

// 3.2

class Stack {
    private var items = [Int]()
    private var minItems = [Int]()

    var description: String { items.description }
    var isEmpty: Bool { items.isEmpty }
    var min: Int? { minItems.last }
    var size: Int { items.count }

    func push(_ item: Int) {
        items.append(item)

        if let lastMin = minItems.last {
            if lastMin > item {
                minItems.append(item)
            }
        } else {
            minItems.append(item)
        }
    }

    func pop() -> Int? {
        if isEmpty {
            return nil
        }

        let last = items.removeLast()

        if let lastMin = minItems.last, lastMin == last {
            minItems.removeLast()
        }

        return last
    }
}

//let stack = Stack()
//stack.push(2)
//stack.push(1)
//stack.push(3)
//stack.push(0)
//stack.pop()
//print(stack.min ?? "none")

// 3.3

class SetOfStacks {
    private let stackSize: Int
    private var stacks = [Stack]()

    var description: String {
        var result = ""
        stacks.forEach { result.append($0.description + "\n") }
        return result
    }
    var count: Int { stacks.count }

    init(stackSize: Int) {
        self.stackSize = stackSize
    }

    func push(_ item: Int) {
        guard let lastStack = stacks.last else {
            createNewStack(with: item)
            return
        }

        if isFull(stack: lastStack) {
            createNewStack(with: item)
        } else {
            lastStack.push(item)
        }
    }

    func pop() -> Int? {
        guard let lastStack = stacks.last else {
            return nil
        }

        let result = lastStack.pop()
        if lastStack.isEmpty {
            stacks.removeLast()
        }
        return result
    }

    func pop(at stackNumber: Int) -> Int? {
        guard stacks.count >= stackNumber else {
            return nil
        }

        let stack = stacks[stackNumber - 1]
        let result = stack.pop()
        if stack.isEmpty {
            stacks.remove(at: stackNumber - 1)
        } else {

        }
        return result
    }

    private func createNewStack(with item: Int) {
        let stack = Stack()
        stack.push(item)
        stacks.append(stack)
    }

    private func isFull(stack: Stack) -> Bool {
        stack.size == stackSize
    }
}

//let setOfStacks = SetOfStacks(stackSize: 1)
//setOfStacks.push(1)
//setOfStacks.push(2)
//setOfStacks.push(3)
//setOfStacks.push(4)
//print(setOfStacks.description)
//print(setOfStacks.pop(at: 1) ?? "none")
//print(setOfStacks.pop() ?? "none")
//print(setOfStacks.pop() ?? "none")
//print(setOfStacks.description)

// 3.5

class MyQueue {
    private var stack1 = Stack()
    private var stack2 = Stack()

    var size: Int { stack1.size + stack2.size }
    var isEmpty: Bool { stack1.isEmpty && stack2.isEmpty }

    func enqueue(_ item: Int) {
        stack1.push(item)
    }

    func dequeue() -> Int? {
        if stack2.isEmpty {
            if stack1.isEmpty {
                return nil
            }

            while let item = stack1.pop() {
                stack2.push(item)
            }
        }

        return stack2.pop()
    }
}

let myQueue = MyQueue()
myQueue.enqueue(1)
myQueue.enqueue(2)
print(myQueue.dequeue() ?? "none")
print(myQueue.dequeue() ?? "none")
myQueue.enqueue(3)
myQueue.enqueue(4)
print(myQueue.dequeue() ?? "none")
myQueue.enqueue(5)
print(myQueue.dequeue() ?? "none")
