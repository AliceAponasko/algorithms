let input = [
    118,
    14,
    98,
    154,
    71,
    127,
    38,
    50,
    36,
    132,
    66,
    121,
    65,
    26,
    119,
    46,
    2,
    140,
    95,
    133,
    15,
    40,
    32,
    137,
    45,
    155,
    156,
    97,
    145,
    44,
    153,
    96,
    104,
    58,
    149,
    75,
    72,
    57,
    76,
    56,
    143,
    11,
    138,
    37,
    9,
    82,
    62,
    17,
    88,
    33,
    5,
    10,
    134,
    114,
    23,
    111,
    81,
    21,
    103,
    126,
    18,
    8,
    43,
    108,
    120,
    16,
    146,
    110,
    144,
    124,
    67,
    79,
    59,
    89,
    87,
    131,
    80,
    139,
    31,
    115,
    107,
    53,
    68,
    130,
    101,
    22,
    125,
    83,
    92,
    30,
    39,
    102,
    47,
    109,
    152,
    1,
    29,
    86
]

enum Constant {
    static let chargingOutletJoltage = 0
}

enum Difference {
    static let one = 1
    static let two = 2
    static let three = 3
}

func findDistributionOfJoltageDifferences(_ input: [Int]) -> [Int: Int] {
    var result = [Int: Int]()
    var sortedListOfAdapters = input.sorted()
    sortedListOfAdapters.append(myDeviceJoltage(input))
    var currentJoltage = Constant.chargingOutletJoltage

    for adapter in sortedListOfAdapters {
        let difference = adapter - currentJoltage
        switch difference {
        case Difference.one,
             Difference.two,
             Difference.three:
            result[difference, default: 0] += 1
        default:
            return result
        }

        currentJoltage = adapter
    }

    return result
}

func myDeviceJoltage(_ input: [Int]) -> Int {
    guard let max = input.max() else { return 0 }
    return max + Difference.three
}

let result = findDistributionOfJoltageDifferences(input)
print(result[Difference.one, default: 0] * result[Difference.three, default: 0])

func findDistinctWaysToConnectMyDevice(_ input: [Int]) -> Int {
    let myDevice = myDeviceJoltage(input)
    var paths = [Constant.chargingOutletJoltage: 1]
    var sortedListOfAdapters = input.sorted()
    sortedListOfAdapters.append(myDevice)

    for adapter in sortedListOfAdapters {
        var newPaths: [Int: Int] = [:]

        for (passedAdapter, possiblePaths) in paths {
            let difference = adapter - passedAdapter

            switch difference {
            case Difference.one,
                 Difference.two,
                 Difference.three:
                newPaths[passedAdapter, default: 0] += possiblePaths
                newPaths[adapter, default: 0] += possiblePaths

            default:
                continue
            }
        }

        paths = newPaths
    }

    return paths[myDevice, default: 0]
}

print(findDistinctWaysToConnectMyDevice(input))
