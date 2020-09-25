import Foundation

// 1.1

extension String {
    func isUnique() -> Bool {
        if isEmpty { return true }
        var value = self
        let first = value.removeFirst()
        return !value.contains(first) ? value.isUnique() : false
    }

    func isUniqueWithMap() -> Bool {
        var result = [Character]()
        for character in self {
            if result.contains(character) {
                return false
            } else {
                result.append(character)
            }
        }
        return true
    }
}

//print("abc".isUniqueWithMap())
//print("123 ".isUniqueWithMap())
//print("123!@#".isUniqueWithMap())
//print(" 123 ".isUniqueWithMap())
//print("aaa".isUniqueWithMap())
//print("abca".isUniqueWithMap())

// 1.4

extension String {
    func replaceSpaces(with sequence: String = "%20") -> String {
        reduce("") { $1 == " " ? $0 + sequence : $0 + String($1) }
    }
}

//print("Hello, can you hear me?".replaceSpaces())

// 1.5

extension String {
    func compress() -> String {
        guard let firstCharacter = first else {
            return self
        }

        var compressedString = ""
        var currentCount = 0
        var currentCharacter = firstCharacter

        for character in self {
            if character == currentCharacter {
                currentCount += 1
            } else {
                compressedString += "\(currentCharacter)\(currentCount)"
                currentCount = 1
                currentCharacter = character
            }
        }

        compressedString += "\(currentCharacter)\(currentCount)"
        return compressedString.count >= count ? self : compressedString
    }
}

//print("abc".compress())
//print("abcabc".compress())
//print("aabc".compress())
//print("aaabc".compress())
//print("aaabbc".compress())
//print("aaabbcc".compress())
//print("aaabbccaaabbcc".compress())

// 1.6

extension Array where Element == Array<Int> {
    mutating func rotateRight() {
        for layer in 0..<count / 2 {
            let first = layer
            let last = count - 1 - layer
            for i in first..<last {
                let offset = i - first
                let top = self[first][i]
                self[first][i] = self[last - offset][first]
                self[last - offset][first] = self[last][last - offset]
                self[last][last - offset] = self[i][last]
                self[i][last] = top
            }
        }
    }
}

var array = [[1, 2, 3, 4], [1, 2, 3, 4], [1, 2, 3, 4], [1, 2, 3, 4]]
array.rotateRight() // [[1, 1, 1, 1], [2, 2, 2, 2], [3, 3, 3, 3], [4, 4, 4, 4]]
print(array)





