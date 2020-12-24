import Foundation

let input =
"""
class: 0-1 or 4-19
row: 0-5 or 8-19
seat: 0-13 or 16-19

your ticket:
11,12,13

nearby tickets:
3,9,18
15,1,5
5,14,9
"""

enum Constant {
    enum Input {
        static let myTicket = "your ticket:"
        static let nearbyTickets = "nearby tickets:"
    }
}

struct Ticket {
    let numericValues: [Int]
}

func parseRequirement(input: String) -> Ticket {
    let components = input.components(separatedBy: .newlines)
    var i = 0
    var component = components[i]

    var requirements = Set<Int>()
    while component != Constant.Input.myTicket {
        let lineComponents = component
            .components(separatedBy: .whitespaces)
            .filter { $0.contains("-") }

        lineComponents.forEach { numberComponent in
            let numbers = numberComponent.components(separatedBy: "-")
            guard let firstNumberString = numbers.first,
                  let lastNumberSrting = numbers.last,
                  let firstNumber = Int(firstNumberString),
                  let lastNumber = Int(lastNumberSrting)
            else {
                return
            }

            for i in firstNumber...lastNumber {
                requirements.insert(i)
            }
        }

        i += 1
        component = components[i]
    }

    return Ticket(numericValues: Array(requirements))
}

func parseMyTicket(input: String) -> Ticket {
    let components = input.components(separatedBy: .newlines)
    var i = 0
    var component = components[i]

    while component != Constant.Input.myTicket {
        i += 1
        component = components[i]
    }

    i += 1
    return Ticket(
        numericValues: components[i]
            .components(separatedBy: ",")
            .compactMap { Int($0) })
}

func parseNearbyTickets(input: String) -> [Ticket] {
    let components = input.components(separatedBy: .newlines)
    var result = [Ticket]()
    var i = 0
    var component = components[i]

    while component != Constant.Input.nearbyTickets {
        i += 1
        component = components[i]
    }

    while i < components.count - 1 {
        i += 1
        result.append(
            Ticket(
                numericValues: components[i]
                    .components(separatedBy: ",")
                    .compactMap { Int($0) }))
    }

    return result
}

func findInvalidRequirements(
    _ requirement: Ticket,
    in nearbyTickets: [Ticket]
) -> [Int] {
    var result = [Int]()

    for ticket in nearbyTickets {
        for number in ticket.numericValues {
            if requirement.numericValues.firstIndex(of: number) == nil {
                result.append(number)
            }
        }
    }

    return result
}

func discardInvalidtickets(
    from nearbyTickets: [Ticket],
    invalidRequirements: [Int]
) -> [Ticket] {
    var result = nearbyTickets

    for requirement in invalidRequirements {
        result.removeAll(where: { $0.numericValues.firstIndex(of: requirement) != nil })
    }

    return result
}

//print(findInvalidRequirements(
//        parseRequirement(input: input),
//        in: parseNearbyTickets(input: input))
//        .reduce(0, +))

//print(discardInvalidtickets(
//        from: parseNearbyTickets(input: input),
//        invalidRequirements: findInvalidRequirements(
//            parseRequirement(input: input),
//            in: parseNearbyTickets(input: input))))
