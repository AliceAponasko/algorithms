import Foundation

func parse(_ input: String) -> [Int] {
    input.components(separatedBy: ",").compactMap { Int($0) }
}

func play(_ input: [Int], until turn: Int) -> Int {
    var last = 0
    var turns = [Int: [Int]]()

    for i in 0..<input.count {
        last = input[i]
        turns[last, default: []].append(i + 1)
    }

    for i in input.count..<turn {
        guard let existingTurns = turns[last] else { fatalError() }

        if existingTurns.count == 1 {
            last = 0
            turns[last, default: []].append(i + 1)
        } else {
            last = existingTurns[existingTurns.count - 1] - existingTurns[existingTurns.count - 2]
            turns[last, default: []].append(i + 1)
        }
    }

    return last
}

print(play(parse("16,12,1,0,15,7,11"), until: 2020))
print(play(parse("16,12,1,0,15,7,11"), until: 30_000_000))
