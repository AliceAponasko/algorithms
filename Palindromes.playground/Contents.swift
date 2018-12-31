import UIKit

// O(N^3)
func countPalindromesN3(_ string: String) -> Int {
    var palindromesCount = 0
    for leftBorder in 0..<string.count {
        for rightBorder in (leftBorder+1)..<string.count {
            if isPalidrom(string, leftBorder: leftBorder, rightBorder: rightBorder) {
                palindromesCount += 1
            }
        }
    }
    return palindromesCount
}
func isPalidrom(_ string: String, leftBorder: Int, rightBorder: Int) -> Bool {
    var left = leftBorder
    var right = rightBorder

    let startIndex = string.startIndex
    while left <= right {
        if string[string.index(startIndex, offsetBy: left)] != string[string.index(startIndex, offsetBy: right)] {
            return false
        }
        left += 1
        right -= 1
    }
    return true
}

let palindromesN3 = countPalindromesN3("ababa")

// O(N^2)
func countPalindromesN2(_ string: String) -> Int {
    if string.count % 2 == 0 {
        return evenCount(string)
    } else {
        return oddCount(string)
    }
}
func oddCount(_ string: String) -> Int {
    var palindromesCount = 0
    let startIndex = string.startIndex

    for middle in 0..<string.count {
        var leftBorder = middle - 1, rightBorder = middle + 1
        while leftBorder >= 0 && rightBorder < string.count &&
            (string[string.index(startIndex, offsetBy: leftBorder)] == string[string.index(startIndex, offsetBy: rightBorder)]) {
                palindromesCount += 1
                leftBorder -= 1
                rightBorder += 1
        }
    }

    return palindromesCount
}
func evenCount(_ string: String) -> Int {
    var palindromesCount = 0
    let startIndex = string.startIndex

    for middle in 0..<string.count {
        var leftBorder = middle, rightBorder = middle + 1
        while leftBorder >= 0 && rightBorder < string.count &&
            (string[string.index(startIndex, offsetBy: leftBorder)] == string[string.index(startIndex, offsetBy: rightBorder)]) {
                palindromesCount += 1
                leftBorder -= 1
                rightBorder += 1
        }
    }

    return palindromesCount
}

let palindromeN2Odd = countPalindromesN2("ababa")
let palindromeN2Even = countPalindromesN2("abbaab")
