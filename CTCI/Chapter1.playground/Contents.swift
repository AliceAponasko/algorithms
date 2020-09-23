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

print("abc".isUniqueWithMap())
print("123 ".isUniqueWithMap())
print("123!@#".isUniqueWithMap())
print(" 123 ".isUniqueWithMap())
print("aaa".isUniqueWithMap())
print("abca".isUniqueWithMap())

// 1.4

extension String {
    func replaceSpaces(with sequence: String = "%20") -> String {
        reduce("") { $1 == " " ? $0 + sequence : $0 + String($1) }
    }
}

print("Hello, can you hear me?".replaceSpaces())
