//: Playground - noun: a place where people can play

import UIKit

// MARK: - 1

func sumMultiplesOf3and5(forNumber number: Int) -> Int {
    var sum = 0

    for i in 0...(number - 1) {
        if i % 3 == 0 || i % 5 == 0 {
            sum += i
        }
    }

    return sum
}

print(sumMultiplesOf3and5(forNumber: 1000))

// MARK: - 2

func evenFibonacciNumbers(_ limit: Int) -> Int {
    if limit < 2 {
        return 0
    }

    if limit == 2 {
        return 2
    }

    var fibonacciSequence = [1, 2]

    for i in 1...limit {
        let nextNumber = fibonacciSequence[i] + fibonacciSequence[i - 1]
        if nextNumber >= limit { break }
        fibonacciSequence.append(nextNumber)
    }

    var sum = 0

    for i in fibonacciSequence {
        if i % 2 == 0 {
            sum += i
        }
    }

    return sum
}

print(evenFibonacciNumbers(4_000_000))

// MARK: - 3

func largestPrimeFactor(_ number: Int) -> Int {
    var startingNumber = number
    var divisor = 2
    var maxDivisor = 1

    while divisor != startingNumber + 1 {
        if startingNumber % divisor == 0 {
            if maxDivisor < divisor {
                maxDivisor = divisor
            }
            startingNumber = startingNumber / divisor
            divisor = 2
        } else {
            divisor += 1
        }
    }

    return maxDivisor
}

print(largestPrimeFactor(600851475143))

// unsuccessful
private func findPrimes(number: Int) -> [Int] {
    var allValues = [Bool](repeating: true, count: number + 1)

    allValues[0] = false
    allValues[1] = false

    for i in 2...Int(sqrt(Double(number))) {
        if allValues[i] == true {
            var j = Int(pow(Double(i),Double(2)))
            var k = 1

            while j <= number {
                allValues[j] = false
                j = Int(pow(Double(i),Double(2))) + k * i
                k += 1
            }
        }
    }

    var result = [Int]()
    for i in 0...allValues.count - 1 {
        if allValues[i] {
            result.append(i)
        }
    }

    return result
}

