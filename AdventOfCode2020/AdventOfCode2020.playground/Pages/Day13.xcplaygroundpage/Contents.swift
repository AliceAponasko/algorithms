import Foundation

let inputTimestamp = 1000434
let inputBusTable =
"""
17,x,x,x,x,x,x,41,x,x,x,x,x,x,x,x,x,983,x,29,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,19,x,x,x,23,x,x,x,x,x,x,x,397,x,x,x,x,x,37,x,x,x,x,x,x,13
"""

struct MyBus {
    let id: Int
    let waitTime: Int
}

func findMyBus(timestamp: Int, input: String) -> MyBus {
    input.components(separatedBy: ",")
        .filter { $0 != "x" }
        .compactMap { Int($0) }
        .compactMap { MyBus(id: $0, waitTime: calculateWaitTime(timestamp: timestamp, bus: $0)) }
        .min(by: { $0.waitTime < $1.waitTime })!
}

func calculateWaitTime(timestamp: Int, bus: Int) -> Int {
    var i = 1
    while bus * i - timestamp < 0 { i += 1 }
    return bus * i - timestamp
}

let bus = findMyBus(timestamp: inputTimestamp, input: inputBusTable)
print(bus.id * bus.waitTime)

struct ContestBus {
    let id: Int
    let departureDelay: Int
}

func parseContestBusses(input: String) -> [ContestBus] {
    let busses = input.components(separatedBy: ",")
    var result = [ContestBus]()
    for i in 0..<busses.count {
        if let id = Int(busses[i]) {
            result.append(ContestBus(id: id, departureDelay: i))
        }
    }
    return result
}


func findRemainder(for bus: ContestBus) -> Int {
    if bus.id - bus.departureDelay >= 0 {
        return bus.id - bus.departureDelay
    } else {
        return bus.id + (bus.id - bus.departureDelay)
    }
}

// https://rosettacode.org/wiki/Chinese_remainder_theorem#Swift
// https://github.com/jonahz5222/Number-Theory-Final/blob/master/NumberTheoryToTheMax/CRTViewController.swift#L109
func chineseRemainderTheorem(_ remainders: [Int], _ mods: [Int]) -> Int {
    var arrayNs = [Int]()
    var arrayXs = [Int]()

    for i in 0..<remainders.count {
        arrayNs.append(1)
        for j in 0..<remainders.count {
            if i != j { arrayNs[i] *= mods[j] }
        }
    }

    var counter = 0
    for i in 0..<remainders.count {
        counter = 1
        while (arrayNs[i] * counter) % mods[i] != 1 { counter += 1 }
        arrayXs.append(counter)
    }

    var result = 0
    var resultMod = 1
    for i in 0..<remainders.count {
        result += remainders[i] * arrayNs[i] * arrayXs[i]
        resultMod *= mods[i]
    }

    return result % resultMod
}

func findEarliestDeparture(input: [ContestBus]) -> Int {
    // X % 17 = 0
    // X % 41 = 34
    // X % 983 = 966
    // X % 29 = 10
    // X % 19 = 2
    // X % 23 = 6
    // X % 397 = 349
    // X % 37 = 20
    // X % 13 = 4

    return chineseRemainderTheorem(
        input.map { findRemainder(for: $0)},
        input.map { $0.id })
}

print(findEarliestDeparture(input: parseContestBusses(input: inputBusTable)))
