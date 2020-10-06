import Foundation

// 3.1

class MultiStack {
    enum Section: Int, CaseIterable {
        case first
        case second
        case third
    }

    var desription: String { storage.description }

    private var stackSize: Int
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

let multiStack = MultiStack(stackSize: 3)
multiStack.push(1, to: .first)
multiStack.push(2, to: .first)
multiStack.push(3, to: .first)
multiStack.push(1, to: .second)
multiStack.push(2, to: .second)
multiStack.push(3, to: .second)
multiStack.push(1, to: .third)
multiStack.push(2, to: .third)
multiStack.push(3, to: .third)
print(multiStack.desription)
print(multiStack.pop(from: .first) ?? "nil")
print(multiStack.pop(from: .second) ?? "nil")
print(multiStack.pop(from: .first) ?? "nil")
print(multiStack.pop(from: .second) ?? "nil")
print(multiStack.pop(from: .first) ?? "nil")
print(multiStack.pop(from: .first) ?? "nil")
