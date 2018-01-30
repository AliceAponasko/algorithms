/*
 Given an NxN grid with an array of lamp coordinates. Each
 lamp provides illumination to every square on their x axis, every square on
 their y axis, and every square that lies in their diagonal (think of a Queen in
 chess). Given an array of query coordinates, determine whether that point is
 illuminated or not.
 */

import UIKit

class LightGrid {

    private var lightColumn = Set<Int>()
    private var lightRow = Set<Int>()
    private var lightDiagDown = Set<Int>()
    private var lightDiagUp = Set<Int>()

    private func diagonalUpId(col: Int, row: Int) -> Int {
        return row + col
    }

    private func diagonalDownId(col: Int, row: Int) -> Int {
        return row - col
    }

    func placeLight(col: Int, row: Int) {
        lightRow.insert(row)
        lightColumn.insert(col)
        lightDiagUp.insert(diagonalUpId(col: col, row: row))
        lightDiagDown.insert(diagonalDownId(col: col, row: row))
    }

    func checkLight(_ col: Int, _ row: Int) -> Bool {
        return lightRow.contains(row) ||
            lightColumn.contains(col) ||
            lightDiagUp.contains(diagonalUpId(col: col, row: row)) ||
            lightDiagDown.contains(diagonalDownId(col: col, row: row))
    }
}

extension LightGrid: CustomStringConvertible {

    private func maxValue(in set: Set<Int>) -> Int {
        if set.isEmpty {
            return 0
        }

        guard var maxValue = set.first else {
            return 0
        }

        for n in set {
            if n > maxValue {
                maxValue = n
            }
        }

        return maxValue
    }

    public var description: String {
        var result = ""

        for r in 0..<maxValue(in: lightRow)+1 {
            for c in 0..<maxValue(in: lightColumn)+1 {
                if checkLight(c, r) {
                    result.append("X ")
                } else {
                    result.append(". ")
                }
            }
            result.append("\n")
        }

        return result
    }
}

let grid = LightGrid()

grid.placeLight(col: 1, row: 1)
grid.placeLight(col: 10, row: 50)

print(grid.description)

grid.checkLight(1, 1) == true
grid.checkLight(1, 999) == true
grid.checkLight(15, 15) == true
grid.checkLight(2, -2) == false
grid.checkLight(10, 49) == true
grid.checkLight(8, 48) == true
grid.checkLight(12, 48) == true
