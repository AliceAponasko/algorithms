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

print("abc".compress())
print("abcabc".compress())
print("aabc".compress())
print("aaabc".compress())
print("aaabbc".compress())
print("aaabbcc".compress())
print("aaabbccaaabbcc".compress())
