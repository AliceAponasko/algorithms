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

        items.forEach {
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

let linkedList = LinkedList()
linkedList.addMultiple(1, 2, 1, 3, 2, 4, 4, 1)
linkedList.removeDuplicates()
print(linkedList.debugDescription)
