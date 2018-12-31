import UIKit

enum CollectionError: Error {
    case isEmpty
}

class Stack {
    private var items = [Int]()
    
    func size() -> Int {
        return items.count
    }
    
    func isEmpty() -> Bool {
        return items.count == 0
    }
    
    func push(_ item: Int) {
        items.append(item)
    }
    
    func pop() throws -> Int {
        if isEmpty() {
            throw CollectionError.isEmpty
        }
        return items.removeLast()
    }
}

class Queue {
    private var items = [Int]()
    
    func size() -> Int {
        return items.count
    }
    
    func isEmpty() -> Bool {
        return items.count == 0
    }
    
    func enqueue(_ item: Int) {
        items.append(item)
    }
    
    func dequeue() throws -> Int {
        if isEmpty() {
            throw CollectionError.isEmpty
        }
        return items.removeFirst()
    }
}

class Node {
    var item: Int!
    var next: Node?
    
    init(item: Int) {
        self.item = item
    }
}

class LinkedList {
    private var first: Node? = nil
    
    func size() -> Int {
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
    
    func removeLast() throws -> Int {
        guard var previous = first else {
            throw CollectionError.isEmpty
        }

        var current = previous.next
        var result: Int = previous.item
        
        if current == nil {
            first = nil
            return result
        }
        
        while current != nil {
            if let next = current?.next {
                previous = current!
                current = next
            } else {
                result = current!.item
                current = nil
                previous.next = nil
            }
        }
        
        return result
    }
    
    func isEmpty() -> Bool {
        return first == nil
    }
}

class StackAsLinkedList {
    private var linkedList = LinkedList()
    
    func size() -> Int {
        return linkedList.size()
    }
    
    func isEmpty() -> Bool {
        return linkedList.isEmpty()
    }
    
    func push(_ item: Int) {
        linkedList.add(item)
    }
    
    func pop() throws -> Int {
        if isEmpty() {
            throw CollectionError.isEmpty
        }
        return try linkedList.removeLast()
    }
}

class QueueAsTwoStacks {
    private var stack1 = Stack()
    private var stack2 = Stack()
    
    func size() -> Int {
        return stack1.size() + stack2.size()
    }
    
    func isEmpty() -> Bool {
        return stack1.size() == 0 && stack2.size() == 0
    }
    
    func enqueue(_ item: Int) {
        stack1.push(item)
    }
    
    func dequeue() throws -> Int {
        if stack2.isEmpty() {
            if stack1.isEmpty() {
                throw CollectionError.isEmpty
            }
            
            while !stack1.isEmpty() {
                let item = try stack1.pop()
                stack2.push(item)
            }
        }
        
        let item = try stack2.pop()
        return item
    }
}

public class CollectionTests {
    
    init() {
        stackTest()
        queueTest()
        stackAsLinkedListTest()
        queueAsTwoStacksTest()
    }
    
    func stackTest() {
        let stack = Stack()
        
        assert(stack.isEmpty())
        assert(stack.size() == 0)
        
        do {
            try stack.pop()
            assert(false)
        } catch _ {}
        
        for i in 0..<10 {
            stack.push(i)
        }
        
        assert(!stack.isEmpty())
        assert(stack.size() == 10)
        
        for i in (7..<10).reversed() {
            do {
                let item = try stack.pop()
                assert(item == i)
            } catch _ {
                assert(false)
            }
        }
    }
    
    func queueTest() {
        let queue = Queue()
        
        assert(queue.isEmpty())
        assert(queue.size() == 0)
        
        do {
            try queue.dequeue()
            assert(false)
        } catch _ {}
        
        for i in 0..<10 {
            queue.enqueue(i)
        }
        
        for i in 0..<5 {
            do {
                let item = try queue.dequeue()
                assert(item == i)
            } catch _ {
                assert(false)
            }
        }
    }
    
    func stackAsLinkedListTest() {
        let stack = StackAsLinkedList()
        
        assert(stack.isEmpty())
        assert(stack.size() == 0)
        
        do {
            try stack.pop()
            assert(false)
        } catch _ {}
        
        for i in 0..<10 {
            stack.push(i)
        }
        
        assert(!stack.isEmpty())
        assert(stack.size() == 10)
        
        for i in (7..<10).reversed() {
            do {
                let item = try stack.pop()
                assert(item == i)
            } catch _ {
                assert(false)
            }
        }
    }
    
    func queueAsTwoStacksTest() {
        let queue = QueueAsTwoStacks()
        
        assert(queue.isEmpty())
        assert(queue.size() == 0)
        
        do {
            try queue.dequeue()
            assert(false)
        } catch _ {}
        
        for i in 0..<10 {
            queue.enqueue(i)
        }
        
        for i in 0..<5 {
            do {
                let item = try queue.dequeue()
                assert(item == i)
            } catch _ {
                assert(false)
            }
        }
    }
}

CollectionTests()
