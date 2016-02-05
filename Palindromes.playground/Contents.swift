import UIKit

// O(N^3)
func countPalindromesN3(string: String) -> Int {
    var palindromesCount = 0
    for var leftBorder = 0; leftBorder < string.characters.count; ++leftBorder {
        for var rightBorder = leftBorder + 1; rightBorder < string.characters.count; ++rightBorder {
            if isPalidrom(string, leftBorder: leftBorder, rightBorder: rightBorder) {
                palindromesCount++
            }
        }
    }
    return palindromesCount
}
func isPalidrom(string: String, var leftBorder: Int, var rightBorder: Int) -> Bool {
    let startIndex = string.startIndex
    while leftBorder <= rightBorder {
        if string[startIndex.advancedBy(leftBorder)] != string[startIndex.advancedBy(rightBorder)] {
            return false
        }
        ++leftBorder
        --rightBorder
    }
    return true
}

let palindromesN3 = countPalindromesN3("ababa")

// O(N^2)
func countPalindromesN2(string: String) -> Int {
    if string.characters.count % 2 == 0 {
        return evenCount(string)
    } else {
        return oddCount(string)
    }
}
func oddCount(string: String) -> Int {
    var palindromesCount = 0
    let startIndex = string.startIndex
    
    for var middle = 0; middle < string.characters.count; ++middle {
        var leftBorder = middle - 1, rightBorder = middle + 1
        while leftBorder >= 0 && rightBorder < string.characters.count &&
            (string[startIndex.advancedBy(leftBorder)] == string[startIndex.advancedBy(rightBorder)]) {
                ++palindromesCount
                --leftBorder
                ++rightBorder
        }
    }
    
    return palindromesCount
}
func evenCount(string: String) -> Int {
    var palindromesCount = 0
    let startIndex = string.startIndex
    
    for var middle = 0; middle < string.characters.count; ++middle {
        var leftBorder = middle, rightBorder = middle + 1
        while leftBorder >= 0 && rightBorder < string.characters.count &&
            (string[startIndex.advancedBy(leftBorder)] == string[startIndex.advancedBy(rightBorder)]) {
                ++palindromesCount
                --leftBorder
                ++rightBorder
        }
    }
    
    return palindromesCount
}
let palindromeN2Odd = countPalindromesN2("ababa")
let palindromeN2Even = countPalindromesN2("abbaab")





