import UIKit

// Given a time calculate the angle between hour and minute hands
let hour = 3.0
let minute = 45.0
let currentHourAngle: Double = 360.0 / 12.0 / 60.0 * (hour * 60.0 + minute)
let currentMinuteAngle = 360 / 60 * minute
let result = max(currentHourAngle - currentMinuteAngle, currentMinuteAngle - currentHourAngle)


// A sorted array has been rotated so that the elements might appear in the order 3 4 5 6 7 1 2. How would you find the minimum element? The array has all unique elements
let rotatedArray: Array<Int> = [5, 6, 7, 1, 2, 3, 4,]
func findMinimum(in rArray: Array<Int>) -> (min: Int, index: Int) {
    var min = rArray[0]
    var index = 0;
    for i in 1..<rArray.count {
        if rArray[i] < min {
            min = rArray[i]
            index = i
            break
        }
    }
    return (min, index)
}
var startingPoint = findMinimum(in: rotatedArray).index
var result2 = rotatedArray[startingPoint..<rotatedArray.count] + rotatedArray[0..<startingPoint]


// A ransom note can be formed by cutting words out of a magazing to form a new sentence. How would you figure out if a ransom note (string) can be formed from a given magazine (string)?
var ransomNote = "hello today is wonderland"
var magazine = "hello! today we will talk about my favorite book alice in wonderland. in fact my name is alice too. which is not related to this article."
func isRansomNoteFromMagazine(ransomNote note: String, magazine: String) -> Bool {
    let extraSeparators: [Character] = [".", ",", "?", "!", ":", ";", "(", ")"]
    let trimmedNote = String(note.filter{extraSeparators.index(of: $0) == nil})
    let trimmedMagazine = String(magazine.filter{extraSeparators.index(of: $0) == nil})
    
    let ransomWords = trimmedNote.components(separatedBy: " ")
    let magazineWords = trimmedMagazine.components(separatedBy: " ")
    
    var mappedRansomNote: Dictionary = [String: Int]()
    for word in ransomWords {
        if let value = mappedRansomNote[word] {
            mappedRansomNote[word] = value + 1
        } else {
            mappedRansomNote[word] = 1
        }
    }
    
    for word in magazineWords {
        if let value = mappedRansomNote[word] {
            if value - 1 == 0 {
                mappedRansomNote.removeValue(forKey: word)
            }
        }
    }
    
    return mappedRansomNote.count == 0
}
var result3 = isRansomNoteFromMagazine(ransomNote: ransomNote, magazine: magazine)


// Print all permutations of a string. For simplicity, assume all characters are unique.
var shortString = "abcd"
var result4 = [String]()
func stringPermutation(_ prefix: String, input: String) {
    if input.count == 0 {
        result4 += [prefix]
        return
    }
    for i in 0..<input.count {
        let currentCharacter = input.index(input.startIndex, offsetBy: i)
        let nextCharacter = input.index(input.startIndex, offsetBy: i+1)
        stringPermutation(prefix + String(input[currentCharacter]),
                          input: input.substring(with: (input.startIndex..<currentCharacter)) +
                            input.substring(from: nextCharacter))
    }
}
stringPermutation("", input: shortString)
result4
















