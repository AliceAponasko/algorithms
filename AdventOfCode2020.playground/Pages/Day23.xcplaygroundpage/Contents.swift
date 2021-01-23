import Foundation

let input =
"""
925176834
"""

func parse(_ input: String) -> [Int] {
    input.reduce(into: [Int]()) { $0.append(Int(String($1))!) }
}

func playCrabCups(_ input: [Int], repeat numberOfRepeats: Int = 100) -> [Int] {
    var cups = input

    guard let min = cups.min(),
          let max = cups.max(),
          var currentCup = cups.first
    else {
        return []
    }

    (0..<numberOfRepeats).forEach { _ in
        var pickedUpCups = cups[cups.firstIndex(of: currentCup)!...].dropFirst().prefix(3)
        pickedUpCups.append(contentsOf: cups.prefix(3 - pickedUpCups.count))
        cups.removeAll(where: { pickedUpCups.contains($0) })

        var destinationCup = currentCup - 1
        while !cups.contains(destinationCup) {
            destinationCup -= 1
            if destinationCup < min { destinationCup = max }
        }

        cups.insert(contentsOf: pickedUpCups, at: cups.firstIndex(of: destinationCup)! + 1)
        currentCup = cups[cups.count == cups.firstIndex(of: currentCup)! + 1 ?
                            0 :
                            cups.firstIndex(of: currentCup)! + 1]
    }

    return cups
}

print(playCrabCups(parse(input)))

class Node {
    let value: Int
    var next: Node?

    init(value: Int) {
        self.value = value
    }
}

// run in Xcode project only, playground runs out of memory
func scaleThisShit(_ input: [Int], repeat numberOfRepeats: Int = 10_000_000) -> (Int, Int) {
    let cups = input.map { Node(value: $0) }
    cups.enumerated().forEach { index, node in
        node.next = cups[cups.count == index + 1 ? 0 : index + 1]
    }

    guard let min = input.min(),
          var currentCup = cups.last
    else {
        return (0, 0)
    }

    var nodes = cups.reduce(into: [Int: Node]()) { $0[$1.value] = $1 }

    ((cups.count + 1)...1_000_000).forEach { value in
        let node = Node(value: value)
        currentCup.next = node
        currentCup = node
        nodes[value] = node
    }

    let max = nodes.map(\.value).map(\.value).max()!
    currentCup.next = cups.first!
    currentCup = cups.first!

    (0..<numberOfRepeats).forEach { _ in
        let next1 = currentCup.next!
        let next2 = next1.next!
        let next3 = next2.next!

        currentCup.next = next3.next

        var destinationCup = currentCup.value - 1
        let pickedUpCups = [next1.value, next2.value, next3.value]

        while destinationCup < 1 || pickedUpCups.contains(destinationCup) {
            destinationCup -= 1
            if destinationCup < min { destinationCup = max }
        }

        let destinationNode = nodes[destinationCup]!
        next3.next = destinationNode.next
        destinationNode.next = next1

        currentCup = currentCup.next!
    }

    return (nodes[1]!.next!.value, nodes[1]!.next!.next!.value)
}

print(scaleThisShit(parse(input)))
