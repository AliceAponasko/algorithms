import Foundation

extension Day4 {

    static func parseData() -> (DrawingNumbers, [Board]) {
        var components = Day4.data.components(separatedBy: "\n\n").map { String($0) }

        return (
            components.removeFirst()
                .components(separatedBy: ",")
                .map { Int($0)! }
                .reduce(into: DrawingNumbers()) { $0.append($1) },
            components.reduce(into: [Board]()) { resultBoards, board in
                resultBoards.append(
                    board.components(separatedBy: "\n")
                        .reduce(into: Board()) { resultBoard, line in
                            resultBoard.grid.append(
                                line
                                    .components(separatedBy: " ")
                                    .filter { $0 != "" }
                                    .map { Int($0)! }
                                    .reduce(into: [Board.Number]()) {
                                        $0.append(Board.Number($1))
                                    }
                            )
                        }
                )
            }
        )
    }

}

class Board {

    class Number {
        var value: Int
        var marked = false

        init(_ value: Int) {
            self.value = value
        }
    }

    var grid = [[Number]]()

    var finished: Bool {
        for (index, line) in grid.enumerated() {
            if check(line: line) || check(line: columns[index]) {
                return true
            }
        }

        return false
    }

    var score: Int {
        grid.reduce(into: 0) { result, line in
            result += line
                .filter { !$0.marked }
                .reduce(into: 0) { $0 += $1.value }
        }
    }

    private lazy var columns: [[Number]] = {
        grid.enumerated().reduce(into: [[Number]]()) { result, iterator in
            result.append(column(at: iterator.offset))
        }
    }()

    @discardableResult
    func mark(_ n: Int) -> Bool {
        for line in grid {
            for number in line {
                if number.value == n {
                    number.marked = true

                    if finished {
                        return true
                    }
                }
            }
        }

        return false
    }

    private func check(line: [Number]) -> Bool {
        line.count == line.filter({ $0.marked }).count
    }

    private func column(at index: Int) -> [Number] {
        grid.reduce(into: [Number]()) { $0.append($1[index]) }
    }

}

typealias DrawingNumbers = [Int]

struct Bingo {

    static func play(drawingNumbers: DrawingNumbers, boards: [Board]) -> Int {
        for drawingNumber in drawingNumbers {
            for board in boards {
                if board.mark(drawingNumber) {
                    return board.score * drawingNumber
                }
            }
        }

        return 0
    }

    static func playLast(drawingNumbers: DrawingNumbers, boards: [Board]) -> Int {
        var lastBoard: Board!
        var lastNumber: Int!

        for drawingNumber in drawingNumbers {
            for board in boards {
                if !board.finished {
                    board.mark(drawingNumber)
                    lastBoard = board
                    lastNumber = drawingNumber
                }
            }
        }

        return lastBoard.score * lastNumber
    }

}

let (drawingNumbers, boards) = Day4.parseData()
print(Bingo.play(drawingNumbers: drawingNumbers, boards: boards))
print(Bingo.playLast(drawingNumbers: drawingNumbers, boards: boards))
