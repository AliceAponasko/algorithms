import UIKit

// 4.1

class Node {
    var left: Node?
    var right: Node?

    init(left: Node?, right: Node?) {
        self.left = left
        self.right = right
    }
}

class Tree {
    var root: Node?

    init(root: Node?) {
        self.root = root
    }

    func checkHeight(with root: Node?) -> Int {
        guard let root = root else {
            return 0
        }

        let leftHeight = checkHeight(with: root.left)
        if leftHeight == -1 {
            return -1
        }

        let rightHeight = checkHeight(with: root.right)
        if rightHeight == -1 {
            return -1
        }

        let heightDiff = abs(leftHeight - rightHeight)
        if heightDiff > 1 {
            return -1
        } else {
            return max(leftHeight, rightHeight) + 1
        }
    }

    func isBalanced(with root: Node?) -> Bool {
        if checkHeight(with: root) == -1 {
            return false
        } else {
            return true
        }
    }
}

let tree = Tree(
    root: Node(
        left: Node(
            left: Node(
                left: Node(
                    left: nil,
                    right: nil),
                right: Node(
                    left: nil,
                    right: nil)),
            right: Node(
                left: nil,
                right: nil)),
        right: Node(
            left: Node(
                left: Node(
                    left: nil,
                    right: nil),
                right: nil),
            right: Node(
                left: nil,
                right: nil))))
tree.isBalanced(with: tree.root)

// 4.2

