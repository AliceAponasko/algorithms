import Foundation

enum CollectionError: Error {
    case isEmpty
}

class Node {
    var item: Int
    var next: Node?

    init(item: Int) {
        self.item = item
    }
}

class LinkedList {
    private var first: Node? = nil

    var debugDescription: String {
        guard var current = first else {
            return ""
        }

        var result: String = "\(current.item)"
        while let next = current.next {
            result.append(" \(next.item)")
            current = next
        }
        return result
    }

    var isEmpty: Bool { first == nil }

    var size: Int {
        var size = 0
        var current = first

        while current != nil {
            size += 1
            current = current?.next
        }

        return size
    }

    func add(_ item: Int) {
        guard var current = first else {
            first = Node(item: item)
            return
        }

        while let next = current.next {
            current = next
        }

        current.next = Node(item: item)
    }

    func add(_ node: Node) {
        guard var current = first else {
            first = node
            return
        }

        while let next = current.next {
            current = next
        }

        current.next = node
    }

    func addMultiple(_ items: Int...) {
        guard let firstItem = items.first else {
            return
        }

        if first == nil {
            first = Node(item: firstItem)
        }

        guard var current = first else {
            return
        }

        while let next = current.next {
            current = next
        }

        items.suffix(from: 1).forEach {
            current.next = Node(item: $0)
            if let next = current.next {
                current = next
            }
        }
    }

    func remove(_ item: Int) {
        guard var current = first else {
            return
        }

        if current.item == item {
            first = current.next
            return
        }

        while let next = current.next {
            if next.item == item {
                current.next = next.next
                break
            } else {
                current = next
            }
        }
    }

    func removeAll() {
        while first != nil {
            try? removeLast()
        }
    }

    func removeLast() throws -> Int {
        guard first != nil else {
            throw CollectionError.isEmpty
        }

        var previous = first
        var current = previous?.next
        var result = previous?.item

        if current == nil {
            first = nil
            return result!
        }

        while current != nil {
            if let next = current?.next {
                previous = current
                current = next
            } else {
                result = current?.item
                current = nil
                previous?.next = nil
            }
        }

        return result!
    }
}

// 2.1

extension LinkedList {
    func removeDuplicates() {
        guard var current = first else {
            return
        }

        while let nextCurrent = current.next {
            var runner = current
            while let nextRunner = runner.next {
                if nextRunner.item == current.item {
                    runner.next = nextRunner.next
                } else {
                    runner = nextRunner
                }
            }
            current = nextCurrent
        }
    }
}

//let linkedList = LinkedList()
//linkedList.addMultiple(1, 2, 1, 3, 2, 4, 4, 1)
//linkedList.removeDuplicates()
//print(linkedList.debugDescription)

// 2.2

extension LinkedList {
    func elementFromLast(at lastIndex: Int) -> Node? {
        var result = first

        for _ in 0..<size - lastIndex {
            result = result?.next
        }

        return result
    }
}

//let linkedList = LinkedList()
//linkedList.addMultiple(1, 2, 3, 4, 5, 6, 7, 8)
//print(linkedList.elementFromLast(at: 3)?.item ?? "error")

// 2.4

extension LinkedList {
    func partition(around value: Int) {
        var current = first
        var lessThanOrEqual = [Node]()
        var after = [Node]()

        while let comparable = current {
            if comparable.item < value {
                lessThanOrEqual.insert(comparable, at: 0)
            } else if comparable.item == value {
                lessThanOrEqual.append(comparable)
            } else {
                after.append(comparable)
            }

            current = comparable.next
        }

        removeAll()
        lessThanOrEqual.forEach { add($0) }
        after.forEach { add($0) }
    }
}

let linkedList = LinkedList()
linkedList.addMultiple(8, 9, 2, 3, 5, 8, 1, 3, 2)
linkedList.partition(around: 3)
print(linkedList.debugDescription)
