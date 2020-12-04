let input = [
    "...#...#....#....##...###....#.",
    "#.#...#...#....#.........#..#..",
    ".#....##..#.#..##..##..........",
    ".....#.#.............#..#......",
    ".......#...#.##.#......#..#.#..",
    "#.#....#......##........##.....",
    ".....##.#....#..#...#...##...#.",
    "...#...#..#.......#..#...##...#",
    "..........#...........##.......",
    "..#..#..#...................#..",
    "#..#....#.....##.#.#..........#",
    ".#.##.......###.....#.#...#....",
    ".#..##....##....#.......#...###",
    "#.#..##...#.#..#...............",
    ".........#....#.......##.#.#...",
    "...###...##....##...#..##.#..#.",
    "....#.........#..#...#.......#.",
    "....................#..#.#.#...",
    "..#....#..........#...........#",
    ".#.....#..#.....##........##..#",
    "#..##..#...##............#..##.",
    ".#..##....#..........#..#.##.#.",
    "..#####..#.#............##.....",
    "...###.#....##..#.#....#.....#.",
    ".#.......##....#...#.#.....##..",
    "...#....#...##.#...#..#........",
    ".####.....#....#.#.#...#.......",
    "...#....#.....#.......#........",
    "#..#.#.......#...#............#",
    "...#.....###.##....#.#.###.#...",
    ".#.........#.......#.#....##...",
    "#.#..#...#.#...##......#..#....",
    ".....#...#..#.#...#..###..#....",
    "......#.........#...###........",
    ".....#..##...#..........#.....#",
    "..#..#.#.##.#...#....#....##..#",
    "##....#.##...#.##.#..##....#...",
    ".....#.#.#.#..#....##.#...#.#..",
    ".....##.......#........#.......",
    "...#.#.....#...#...##.#......##",
    "........#..#.#...#.#.....#.#..#",
    "#..##...#.#...##..##...#.#...##",
    ".##.#.#..#...#.....#.#.##.#...#",
    ".#.####.........##.........#..#",
    ".##..............#....#...#...#",
    "......#...#..#...#..#..###.#...",
    ".......##...#.#.#..##..#......#",
    ".....#....#..##..#.........#...",
    ".....#..#.#.#........#.#.####..",
    "#..#.......###....##...........",
    "#..##..........#.#......#.#....",
    ".....##........#...#..##.......",
    "###...#.##.#.#.#.#.##...##.....",
    "....#...#........##.#.##..##...",
    ".#..#.#.#......#.......##..#..#",
    ".#...#.................#....#..",
    ".##..#..........#..##.......#..",
    ".#.#.#.....#..#.#.........##..#",
    "...#......##...#.......#...##..",
    "##...###....#.###.............#",
    "#.....#.#..#.#..#........#.#.#.",
    ".....#.#......##..#.#.....#.##.",
    ".......#...........#..#.......#",
    "..#....#.#.#......#.....#...#..",
    ".....##........#..##..#..##....",
    "#.#........#...##....#.#..##...",
    "#......#......#....#..#...#.##.",
    "....#.#.......#.#.#............",
    "......####.#.##...#.#.##.....##",
    "..###.#.#..#.........#.####....",
    ".#.......#..#.#....#.#..#.#.##.",
    "#....#....#............##...##.",
    "....#....#............#....#..#",
    "..#........#..#....#..#..#...#.",
    ".#......##....#..........#....#",
    "#.##.....#..........#.###.#....",
    "....##...#.....#.#......#.##...",
    "#.#.....#.......###.###..#..#.#",
    "..###..##.............#.####.##",
    "#....#.....#....#..##.......#..",
    ".....#....#...#.#.#.#..#...#.##",
    "...#.....#..#....###......#.#.#",
    "##.........#.#..#..#.#..#.....#",
    ".#.....#.#....#.........##..#.#",
    ".#.#..#.###..#..#..........#...",
    ".##....#.#.#...#......##.....#.",
    "#.#....#....#...#...##...#..#..",
    "#...#........#....#....#......#",
    "#......#...#..#.#.##.....##..#.",
    "....#...#......##...#..#....#..",
    ".#......##.##.......#.......#..",
    ".#...#..####...........#.#.#...",
    ".........#...#.#.........#.....",
    "#.##.....#.#..#.#.###...###..#.",
    "#...##.###......#.###..##.#.##.",
    "...##.#.....#....#..#......#...",
    "#....###.#..#...##.....#......#",
    "........###...#...#............",
    "........#....#...#...#....#...#",
    "#....#..#..#....#.#........#.#.",
    "##...#.....#.#..........#..#..#",
    "#.#...##.....#........#...#...#",
    "##.#.#.......#...#..#.###....#.",
    ".#.......#....##..##...#.....#.",
    "#....#....#.....#.......#......",
    ".##.##.##...##...#.#.#..#..#...",
    "#..#..#.##....#......##....###.",
    ".......#.#.........#..##.#...##",
    ".#..##...#....#.....#..........",
    "..#.#...#......#.#..#..........",
    ".##....#.#.#.##.......###...#..",
    "..##.#...#.#.#.#.......#..#....",
    "#..#.......#...#........#.....#",
    ".....#.......#......###..#.....",
    "...##.#.......#.....##.....##..",
    "##..#.......#.#.....#....#.....",
    "..#....#.##.##...#...#......#..",
    ".#..#.###.#....###........#...#",
    "....##.##...##..#..#.#....#....",
    "..###...##.....##..............",
    "#....#...##...#....#..........#",
    ".##........#......##...##...#.#",
    "..#.#.##..........#......#.....",
    "...#...#.........#.##........##",
    "..#.#..#.#..#...#....#...#.....",
    "...##...#..#.###.#..#.#...#....",
    "....###........#..#..##...#....",
    "#.#....##.......#.#........#...",
    ".###...#..#.#.#.#..#...#..##.##",
    "..#.........#####.#......#..#..",
    "#.....#.....##..#....#...#...#.",
    "...#..#....##....##.....##.#...",
    ".........#............#.##.....",
    "....##.#..#....#.##.......#..##",
    ".###....#.#..#......#.#.......#",
    ".###...###.#.........#.#..#...#",
    ".....#........#..#.#..#.#..##.#",
    ".###..#....##.........#..##....",
    "..#.......#..#..##...#.###.#...",
    "#.......#...........#.#...#.###",
    "#.##.##...##.#...##..#.....#...",
    "..#..#........###.#.....##.....",
    "#.....##....#...##...####..#..#",
    "....#........#...#...#.........",
    "......#.#.#.#.......#..#.....##",
    "..#..#....#.....#.#...##......#",
    "..#....#...#.###.........#.###.",
    "...#......##..#.#.....#...#....",
    "...#.......#...#...#........##.",
    "............#...#..#....#.....#",
    "....##......................#..",
    "#.#.#....#....#..........##....",
    "#.#.....#.#.##..#...#.##....##.",
    "...#...#..#...#..#.#.#.......#.",
    "#.....#..........#.........##.#",
    "#...##..#..#.#.......###....#..",
    ".#...#..##....#.....##.......#.",
    "....#.##.....#.........#.#....#",
    "........#.#...####..#.......#.#",
    ".####...#.#......####.....#.##.",
    "###..#....#..#.......#.#..##..#",
    "#......#.#....##..#.##.#....#.#",
    "...###...#...#..##.#..#..#.#...",
    "...##..##....#..#.....#........",
    ".....#..............#......#..#",
    "......#....#......#..#.........",
    "#..#.....#.##...........##.....",
    ".#..#.#..................##....",
    "#.#..#..##...#....#.#......#...",
    ".##.#.##......#.##...#...#...#.",
    "..#...#.........#.#..#.#....#..",
    ".#.####.#..#.#......##.#..#....",
    "#..#.......#....#..............",
    "....#............#..#..........",
    ".....#####.....#.....#..##...##",
    "#.#....#.#...............#..##.",
    ".#.#..#...#......#.....#.#.#...",
    ".#....#.#.#......#.....##....#.",
    "....#....#.##..#.......###...##",
    ".....#..#.##...#...#...#..#.#..",
    "##..#........#.#..#..##......#.",
    ".#..#..##.......#..#.....#.....",
    ".#.#.....###..##.#.#...........",
    "..##..##.####..........#..#....",
    "..##..#..#...#....#......#.#...",
    "#...#.#......##.....##.#..###..",
    "#..#..............#........##.#",
    ".........#.##..#.#..#..##.##.#.",
    "#....##....#.#..#.#...##..#....",
    ".#....#.......#............##..",
    ".......#.#.......#...#.#......#",
    "......##...#.......#.#........#",
    "..###..#.#.##....##...#....##..",
    "..##.##..........##..###.......",
    ".#.#.#..#..#.#.......#.#...##..",
    "..#..##.........#.###..#......#",
    "....#.#.#...##.#...#...##..###.",
    "..###..##.........##...#...#..#",
    ".#..##...#.......#.......#..#.#",
    "........##....##....#.#.###.#.#",
    "#.....#.#.................#.#..",
    "....#.#.#.....##.####.#......#.",
    "....#.......#.#.##.##..........",
    "...#...........#...#.##...#.###",
    "#....#....#..........#.##......",
    "##..#...........##.....##.##...",
    ".#.##...##..##....#..#.....####",
    "#...#...#.##..........##..##...",
    "....##..#....#.....#.#...#....#",
    "..#....#..##...###.#.#.........",
    "#......#.#.#...#...#.........#.",
    "#............###.#.#.#..##...#.",
    ".##.....####...##..##..#..##.#.",
    "#..#........#.....#.#.....#...#",
    "#............#....#.#.#........",
    "......##...##.#....#.....#...#.",
    "..#........##......#.#.....##..",
    ".#..#..#.....##.......#..#.#..#",
    ".#....#..#....##.#.#.#..#..#.##",
    ".####.#..........#...#..##.....",
    "...###..###...##..#............",
    "#..#.....##.#...#..##..#.......",
    ".....##....#...###.##...#......",
    "...##..#...#..#..##....##....#.",
    "...###....#.###.#.#.##....#....",
    "##.#.#.....#....#.#....#..#....",
    ".......##.....#.#..##...##...#.",
    ".#....#.#...##.#..#....#.....#.",
    "..#...#..#...#.##........#...#.",
    "#....#......##.#....##...#.#..#",
    ".....#..#..#..#......#...#.#.#.",
    "..###....#........#...#.......#",
    "###...#.......#.#.......##.##..",
    "......##.....#.#........#....#.",
    "#.##..#.#.#.#..#....#.##.....#.",
    "..........#.##.#...#...#..#..#.",
    "..#...##.#..........#..##.###..",
    "..###..##.##..#.#...##.####..#.",
    "#.#.#...............##....###.#",
    "....#.........#.#....#.#....#.#",
    "..#...#.###...#....###.....#...",
    "..#..#....#...#............#...",
    ".#..#....#..##.....##..........",
    "..#....#.#...#.#.#.#.......##.#",
    ".........#....##........#.#....",
    "...#..##.#..#.##...#...#.#....#",
    "....####...#...####.#....###..#",
    "......##...#.##.#.......#..#...",
    "#.#...#.#...#.#...#....#.#.#...",
    ".#.....##...#.....###.#....#...",
    "......##.....###...#.#...#.#...",
    "#..#..##.#.#......#....#..#..#.",
    "....#.###.....#..#...#.##.....#",
    "##.##........#......#....#..##.",
    "##.....##.#.....#.....##.....#.",
    ".....#.##...#.#..#.#.#.....#...",
    ".#.##..#...#.#..#.....#.#......",
    ".....##.......#..#...##..#..#..",
    "#.....#..#.####......#........#",
    ".#..#..##.#..##............#..#",
    ".##..#.#....##.##.....#......#.",
    ".......##.........#..#.........",
    ".#...#.......................#.",
    "#......#.#....##.#.......#..#..",
    "..##..##......#.......#....#.#.",
    "##......#......##...##.........",
    "..#....####....#.#.....##.#.#..",
    "..........#..#.#.#.....#..#.#..",
    "##..##...........##.......#....",
    "##....#.#....#..#......###....#",
    "...#.#.#..#.......##.......#...",
    "#....#.......#.......#.........",
    "...##......##....#...#......#.#",
    "#......#####.#.........#.....#.",
    "#..#.............#..#....#...#.",
    ".......#.##..#..#..#..#....####",
    "......#.##..##..........###...#",
    ".#.##....###..#........#....##.",
    "#......#..#...###.#...#.....#..",
    ".#.#.......#....##.......#.#...",
    "..#.##..#..##.....#.........#.#",
    "#.#...#..#.##....#.......##....",
    ".#.....###....#.#..#...#.....#.",
    "#...#..#.......#.#.....##...#.#",
    "#.#####.........#....##.....#..",
    "#....#..##...#....#.##.......#.",
    ".#.#.........##....##....#.....",
    "...#..##.......#....#.#.#......",
    "#.###.##...###....#.....#.####.",
    ".#...#.#.#..##.#..........#....",
    "#.#.....#.##.#..####.....##.#..",
    "...###.##..####.......#......##",
    ".##..#.........#...#.#.....#.##",
    "..#.....##....###.....#.#...##.",
    "#....#....#..#....#.##.........",
    "......###....#.#..#..#....##...",
    ".#.#................#.......##.",
    "...#.......#.........#.#.......",
    "...#..........#...##.....###...",
    "....#......#...#...............",
    ".##...#....#.....#.##......#...",
    ".#.....###...##..##...#.#......",
    "....##........#.....#...#....#.",
    "#.........#.#...##...#.#..#....",
    "...#.#.....#.#........#.#....#.",
    ".#........#.....#.#.#.#.#..#...",
    "....#...#.....#.#....#........#",
    "..###.#....#.#....##...##..#.##",
    ".#....#.#.####.#.#.....#.......",
    ".#...#...#.................##.#",
    "..................##..#..#.#.#.",
    ".#..#............##....###.....",
    ".......#....#...........#......",
    "....#.#.#.....###.........#..##",
    "...#.#....#.#.##.#.##.....##..#",
    ".#.##.#...##...#.......#.....##",
    ".#............#...#..##...#.#.#",
    "#.##..#.##..#..##.###.#........",
    "..............##....#...#..#.#.",
    ".#.#...#.#....#....###........#",
    ".#....#.#....#......###........",
    "..#.......##......#.##.....#...",
    ".....#......#..#...#.#.....#..."
]
let tree = Character("#")

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

func countTrees(_ input: [String], rightSlide: Int, downSlide: Int) -> Int {
    var start = rightSlide
    var i = downSlide
    var numberOfTrees = 0

    while i < input.count {
        if input[i][start % input[i].count] == tree {
            numberOfTrees += 1
        }

        start += rightSlide
        i += downSlide
    }

    return numberOfTrees
}

print(countTrees(input, rightSlide: 1, downSlide: 1))
print(countTrees(input, rightSlide: 3, downSlide: 1))
print(countTrees(input, rightSlide: 5, downSlide: 1))
print(countTrees(input, rightSlide: 7, downSlide: 1))
print(countTrees(input, rightSlide: 1, downSlide: 2))

print(countTrees(input, rightSlide: 1, downSlide: 1) *
      countTrees(input, rightSlide: 3, downSlide: 1) *
      countTrees(input, rightSlide: 5, downSlide: 1) *
      countTrees(input, rightSlide: 7, downSlide: 1) *
      countTrees(input, rightSlide: 1, downSlide: 2))
