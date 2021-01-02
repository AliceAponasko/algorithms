import Foundation

let input =
"""
Tile 2311:
..##.#..#.
##..#.....
#...##..#.
####.#...#
##.##.###.
##...#.###
.#.#.#..##
..#....#..
###...#.#.
..###..###

Tile 1951:
#.##...##.
#.####...#
.....#..##
#...######
.##.#....#
.###.#####
###.##.##.
.###....#.
..#.#..#.#
#...##.#..

Tile 1171:
####...##.
#..##.#..#
##.#..#.#.
.###.####.
..###.####
.##....##.
.#...####.
#.##.####.
####..#...
.....##...

Tile 1427:
###.##.#..
.#..#.##..
.#.##.#..#
#.#.#.##.#
....#...##
...##..##.
...#.#####
.#.####.#.
..#..###.#
..##.#..#.

Tile 1489:
##.#.#....
..##...#..
.##..##...
..#...#...
#####...#.
#..#.#.#.#
...#.#.#..
##.#...##.
..##.##.##
###.##.#..

Tile 2473:
#....####.
#..#.##...
#.##..#...
######.#.#
.#...#.#.#
.#########
.###.#..#.
########.#
##...##.#.
..###.#.#.

Tile 2971:
..#.#....#
#...###...
#.#.###...
##.##..#..
.#####..##
.#..####.#
#..#.#..#.
..####.###
..#.#.###.
...#.#.#.#

Tile 2729:
...#.#.#.#
####.#....
..#.#.....
....#..#.#
.##..##.#.
.#.####...
####.#.#..
##.####...
##..#.##..
#.##...##.

Tile 3079:
#.#.#####.
.#..######
..#.......
######....
####.#..#.
.#...#.##.
#.#####.##
..#.###...
..#.......
..#.###...
"""

enum TileValue: String {
    case dot = "."
    case pound = "#"
}

struct Tile: Equatable {
    let id: Int
    let values: [[TileValue]]

    var debugDescription: String {
        var result = ""
        values.forEach { line in
            line.forEach { tileValue in
                result.append(tileValue.rawValue)
            }
            result.append("\n")
        }
        return result
    }

    var allEdges: Set<[TileValue]> {
        let edges = Set<[TileValue]>([top, bottom, left, right])
        return edges.union(edges.map { $0.reversed() })
    }

    var top: [TileValue] { values.first ?? [] }
    var bottom: [TileValue] { values.last ?? [] }
    var left: [TileValue] { values.map { $0.first ?? .dot } }
    var right: [TileValue] { values.map { $0.last ?? .dot } }

    func flip() -> Tile {
        Tile(id: id, values: values.flip())
    }

    func rotate() -> Tile {
        Tile(id: id, values: values.rotate())
    }

    func isNear(tile: Tile) -> Bool {
        !allEdges.isDisjoint(with: tile.allEdges)
    }
}

extension Array where Element == [TileValue] {
    // https://gist.github.com/BrettBukowski/4b4e55ce42865106c2c0
    func rotate() -> Self {
        var result = self
        (0..<(count / 2)).forEach { layer in
            let first = layer
            let last = count - 1 - layer

            (first..<last).forEach { i in
                let offset = i - first
                let top = result[first][i]

                // top is now left
                result[first][i] = result[last - offset][first]
                // left is now bottom
                result[last - offset][first] = result[last][last - offset]
                // bottom is now right
                result[last][last - offset] = result[i][last]
                // right is now top
                result[i][last] = top
            }
        }
        return result
    }

    func flip() -> Self {
        var result = self
        (0..<self.count).forEach { i in
            result[i] = result[i].reversed()
        }
        return result
    }
}

extension Array where Element == [TileValue] {
    var debugDescription: String {
        var result = ""
        forEach { tiles in
            tiles.forEach { tileValue in
                result.append(tileValue.rawValue)
            }
            result.append("\n")
        }
        return result
    }
}

extension Array where Element == [Tile] {
    var debugDescription: String {
        var result = ""
        forEach { tiles in
            tiles.forEach { tile in
                result.append(tile.debugDescription + "\n")
            }
        }
        return result
    }
}

extension Array where Element == Tile {
    var debugDescription: String {
        var result = ""
        forEach { tile in
            result.append(tile.debugDescription + "\n")
        }
        return result
    }
}

func parse(_ input: String) -> [Tile] {
    var result = [Tile]()

    input.components(separatedBy: "\n\n").forEach { fullTile in
        var tileID = 0
        var tileValues = [[TileValue]]()

        fullTile.components(separatedBy: .newlines).forEach { line in
            if line.hasPrefix("Tile ") {
                var idLine = line
                idLine.removeFirst("Tile ".count)
                idLine.removeLast()
                guard let id = Int(idLine) else { return }
                tileID = id
            } else {
                var currentValues = [TileValue]()
                line.forEach { value in
                    guard let tileValue = TileValue(rawValue: String(value)) else { return }
                    currentValues.append(tileValue)
                }
                tileValues.append(currentValues)
            }
        }
        result.append(Tile(id: tileID, values: tileValues))
    }

    return result
}

func findCorners(tiles: [Tile]) -> [Tile] {
    tiles.filter { tile in tiles.filter { $0.isNear(tile: tile) }.count == 3 }
}

//print(findCorners(tiles: parse(input)).map(\.id).reduce(1, *))

func arrange(tiles: [Tile]) -> [[Tile]] {
    var image = [[Tile]]()
    var uniqueTiles = tiles

    let imageSize = Int(sqrt(Double(uniqueTiles.count)))
    guard let firstTile = findCorners(tiles: uniqueTiles).first else { return [] }

    image.append(populateLine(lineStart: firstTile, from: uniqueTiles, imageSize: imageSize))
    uniqueTiles = uniqueTiles.filter { !image.reduce([Tile](), +).contains($0) }

    var possibleNextLineStart: Tile?
    for i in 0..<uniqueTiles.count {
        if image[0][0].bottom == uniqueTiles[i].top {
            possibleNextLineStart = uniqueTiles[i]
            break
        } else if image[0][0].bottom == uniqueTiles[i].flip().top {
            possibleNextLineStart = uniqueTiles[i].flip()
            break
        } else if image[0][0].bottom == uniqueTiles[i].rotate().top {
            possibleNextLineStart = uniqueTiles[i].rotate()
            break
        } else if image[0][0].bottom == uniqueTiles[i].rotate().rotate().top {
            possibleNextLineStart = uniqueTiles[i].rotate().rotate()
            break
        } else if image[0][0].bottom == uniqueTiles[i].rotate().rotate().rotate().top {
            possibleNextLineStart = uniqueTiles[i].rotate().rotate().rotate()
            break
        } else if image[0][0].bottom == uniqueTiles[i].flip().rotate().top {
            possibleNextLineStart = uniqueTiles[i].flip().rotate()
            break
        } else if image[0][0].bottom == uniqueTiles[i].flip().rotate().rotate().top {
            possibleNextLineStart = uniqueTiles[i].flip().rotate().rotate()
            break
        } else if image[0][0].bottom == uniqueTiles[i].flip().rotate().rotate().rotate().top {
            possibleNextLineStart = uniqueTiles[i].flip().rotate().rotate().rotate()
            break
        }
    }

    if possibleNextLineStart == nil {
        var newLine = [Tile]()
        image.forEach { line in
            line.forEach { tile in
                newLine.append(tile.rotate().rotate().flip())
            }
        }
        image[0] = newLine
    }

    var definedLineIndex = 1
    while definedLineIndex < imageSize {
        // find the first element of the line
        let previousLine = image[definedLineIndex - 1]
        let topTile = previousLine[0]

        var possibleLineStart: Tile?
        for i in 0..<uniqueTiles.count {
            if topTile.bottom == uniqueTiles[i].top {
                possibleLineStart = uniqueTiles[i]
                break
            } else if topTile.bottom == uniqueTiles[i].flip().top {
                possibleLineStart = uniqueTiles[i].flip()
                break
            } else if topTile.bottom == uniqueTiles[i].rotate().top {
                possibleLineStart = uniqueTiles[i].rotate()
                break
            } else if topTile.bottom == uniqueTiles[i].rotate().rotate().top {
                possibleLineStart = uniqueTiles[i].rotate().rotate()
                break
            } else if topTile.bottom == uniqueTiles[i].rotate().rotate().rotate().top {
                possibleLineStart = uniqueTiles[i].rotate().rotate().rotate()
                break
            } else if topTile.bottom == uniqueTiles[i].flip().rotate().top {
                possibleLineStart = uniqueTiles[i].flip().rotate()
                break
            } else if topTile.bottom == uniqueTiles[i].flip().rotate().rotate().top {
                possibleLineStart = uniqueTiles[i].flip().rotate().rotate()
                break
            } else if topTile.bottom == uniqueTiles[i].flip().rotate().rotate().rotate().top {
                possibleLineStart = uniqueTiles[i].flip().rotate().rotate().rotate()
                break
            }
        }

        guard let lineStart = possibleLineStart else { fatalError("Cannot find line start") }
        image.append(populateLine(lineStart: lineStart, from: uniqueTiles, imageSize: imageSize))
        uniqueTiles = uniqueTiles.filter { !image.reduce([Tile](), +).contains($0) }
        definedLineIndex += 1
    }

    return image
}

func populateLine(lineStart: Tile, from tiles: [Tile], imageSize: Int) -> [Tile] {
    var uniqueTiles = tiles
    var line = [lineStart]
    var definedTileIndex = 1
    var i = 0
    var currentTile = lineStart

    while definedTileIndex < imageSize {
        var alignedTile: Tile?
        if currentTile.right == uniqueTiles[i].left {
            alignedTile = uniqueTiles[i]
        } else if currentTile.right == uniqueTiles[i].flip().left {
            alignedTile = uniqueTiles[i].flip()
        } else if currentTile.right == uniqueTiles[i].rotate().left {
            alignedTile = uniqueTiles[i].rotate()
        } else if currentTile.right == uniqueTiles[i].rotate().rotate().left {
            alignedTile = uniqueTiles[i].rotate().rotate()
        } else if currentTile.right == uniqueTiles[i].rotate().rotate().rotate().left {
            alignedTile = uniqueTiles[i].rotate().rotate().rotate()
        } else if currentTile.right == uniqueTiles[i].flip().rotate().left {
            alignedTile = uniqueTiles[i].flip().rotate()
        } else if currentTile.right == uniqueTiles[i].flip().rotate().rotate().left {
            alignedTile = uniqueTiles[i].flip().rotate().rotate()
        } else if currentTile.right == uniqueTiles[i].flip().rotate().rotate().rotate().left {
            alignedTile = uniqueTiles[i].flip().rotate().rotate().rotate()
        }

        if let foundAlignedTile = alignedTile {
            currentTile = foundAlignedTile
            line.append(currentTile)
            if let index = uniqueTiles.firstIndex(of: uniqueTiles[i]) {
                uniqueTiles.remove(at: index)
            }
            definedTileIndex += 1
            i = 0
        } else {
            i += 1
        }
    }

    return line
}

func constructImage(from arrangedTiles: [[Tile]]) -> [[TileValue]] {
    var noBordersTiles = arrangedTiles
    for i in 0..<arrangedTiles.count {
        let tileRow = arrangedTiles[i]
        for j in 0..<tileRow.count {
            var noBordersValues = tileRow[j].values
            noBordersValues = noBordersValues.dropFirst().dropLast().map { $0.dropFirst().dropLast() }
            noBordersTiles[i][j] = Tile(id: tileRow[j].id, values: noBordersValues)
        }
    }

    let tileSize = noBordersTiles.first!.first!.values.count
    let newImageSize = noBordersTiles.count * tileSize
    var image = Array(repeating: Array(repeating: TileValue.dot, count: newImageSize), count: newImageSize)

    var horizontalOffset = 0
    var verticalOffset = 0
    for i in 0..<noBordersTiles.count {
        let lineOfTiles = noBordersTiles[i]

        for j in 0..<lineOfTiles.count {
            let tile = lineOfTiles[j]

            for k in 0..<tile.values.count {
                let lineOfTileValues = tile.values[k]

                for m in 0..<lineOfTileValues.count {
                    image[k + verticalOffset][m + horizontalOffset] = lineOfTileValues[m]
                }
            }

            horizontalOffset += tileSize
        }

        horizontalOffset = 0
        verticalOffset += tileSize
    }

    return image
}

print(constructImage(from: arrange(tiles: parse(input))).debugDescription)

let seaMonster =
"""
..................#.
#....##....##....###
.#..#..#..#..#..#...
"""
