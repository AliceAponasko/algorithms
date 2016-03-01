import UIKit

func sum(one: String, two: String) -> String {
    let oneArray = Array(one.characters)
    let twoArray = Array(two.characters)
    
    var result = ""
    var carriedNumber = false
    
    for var i = oneArray.count - 1; i >= 0; i-- {
        if oneArray[i] == "0" && twoArray[i] == "0" {
            result += carriedNumber ? "1" : "0"
            carriedNumber = false
        } else if oneArray[i] == "1" && twoArray[i] == "1" {
            result += carriedNumber ? "1" : "0"
            carriedNumber = true
        } else {
            result += carriedNumber ? "0" : "1"
        }
    }
    
    if result.characters.last == "0" && carriedNumber {
        let range = Range(start: result.endIndex.advancedBy(-1), end: result.endIndex)
        result.stringByReplacingCharactersInRange(range, withString: "1")
    }
    
    return String(result.characters.reverse())
}

sum("100101", two: "001101") // 110010
sum("0010", two: "0010") // 0100
sum("111111", two: "111111") // 1111110
