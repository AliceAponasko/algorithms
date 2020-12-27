import Foundation

let input =
"""
..#..##.
#.....##
##.#.#.#
..#...#.
.###....
######..
.###..#.
..#..##.
"""

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

extension String {
    func parseActiveCoordinatesFor3D() -> [Coordinate] {
        var result = [Coordinate]()
        let lines = components(separatedBy: .newlines)

        for y in 0..<lines.count {
            for x in 0..<lines[y].count {
                if lines[y][x] == Constant.State.active {
                    result.append(Coordinate(x: x, y: y, z: 0))
                }
            }
        }

        return result
    }

    func parseActiveCoordinatesFor4D() -> [Coordinate4D] {
        var result = [Coordinate4D]()
        let lines = components(separatedBy: .newlines)

        for y in 0..<lines.count {
            for x in 0..<lines[y].count {
                if lines[y][x] == Constant.State.active {
                    result.append(Coordinate4D(x: x, y: y, z: 0, w: 0))
                }
            }
        }

        return result
    }
}

enum Constant {
    enum State {
        static let active: Character = "#"
        static let inactive: Character = "."

        enum Rules {
            static let activeRemainsActive = (2, 3)
            static let inactiveBecomesActive = 3
        }
    }

    enum Cycles {
        static let number = 6
    }
}

struct Coordinate: Hashable {
    let x: Int
    let y: Int
    let z: Int

    var debugDescription: String { "\(x), \(y), \(z)" }

    var neighbors: [Coordinate] {
        var neighbours = [Coordinate]()
        (x - 1...x + 1).forEach { x in
            (y - 1...y + 1).forEach { y in
                (z - 1...z + 1).forEach { z in
                    neighbours.append(Coordinate(x: x, y: y, z: z))
                }
            }
        }
        neighbours.remove(at: neighbours.firstIndex(of: self)!)
        return neighbours
    }
}

func runCycles(
    input: [Coordinate],
    _ numberOfCycles: Int = Constant.Cycles.number
) -> [Coordinate] {
    var activeCoordinates = input

    (0..<numberOfCycles).forEach { _ in
        var nonUniquePossibleCoordinates = activeCoordinates
        for neighbor in activeCoordinates.map(\.neighbors) {
            nonUniquePossibleCoordinates.append(contentsOf: neighbor)
        }

        let possibleCoordinates = Set(nonUniquePossibleCoordinates)
        let newActiveCoordinates = possibleCoordinates.filter { coordinate in
            let activeNeighbors = coordinate.neighbors.filter { activeCoordinates.contains($0) }
            if activeCoordinates.contains(coordinate) {
                return activeNeighbors.count == Constant.State.Rules.activeRemainsActive.0 ||
                    activeNeighbors.count == Constant.State.Rules.activeRemainsActive.1
            } else {
                return activeNeighbors.count == Constant.State.Rules.inactiveBecomesActive
            }
        }

        activeCoordinates = Array(newActiveCoordinates)
    }

    return activeCoordinates
}

//print(runCycles(input: input.parseActiveCoordinatesFor3D()).count)

struct Coordinate4D: Hashable {
    let x: Int
    let y: Int
    let z: Int
    let w: Int

    var debugDescription: String { "\(x), \(y), \(z), \(w)" }

    var neighbors: [Coordinate4D] {
        var neighbours = [Coordinate4D]()
        (x - 1...x + 1).forEach { x in
            (y - 1...y + 1).forEach { y in
                (z - 1...z + 1).forEach { z in
                    (w - 1...w + 1).forEach { w in
                        neighbours.append(Coordinate4D(x: x, y: y, z: z, w: w))
                    }
                }
            }
        }
        neighbours.remove(at: neighbours.firstIndex(of: self)!)
        return neighbours
    }
}

func runCycles(
    input: [Coordinate4D],
    _ numberOfCycles: Int = Constant.Cycles.number
) -> [Coordinate4D] {
    var activeCoordinates = input

    (0..<numberOfCycles).forEach { _ in
        var nonUniquePossibleCoordinates = activeCoordinates
        for neighbor in activeCoordinates.map(\.neighbors) {
            nonUniquePossibleCoordinates.append(contentsOf: neighbor)
        }

        let possibleCoordinates = Set(nonUniquePossibleCoordinates)
        let newActiveCoordinates = possibleCoordinates.filter { coordinate in
            let activeNeighbors = coordinate.neighbors.filter { activeCoordinates.contains($0) }
            if activeCoordinates.contains(coordinate) {
                return activeNeighbors.count == Constant.State.Rules.activeRemainsActive.0 ||
                    activeNeighbors.count == Constant.State.Rules.activeRemainsActive.1
            } else {
                return activeNeighbors.count == Constant.State.Rules.inactiveBecomesActive
            }
        }

        activeCoordinates = Array(newActiveCoordinates)
    }

    return activeCoordinates
}

print(runCycles(input: input.parseActiveCoordinatesFor4D()).count)
