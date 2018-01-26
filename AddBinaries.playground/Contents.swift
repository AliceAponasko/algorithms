import UIKit

func sum(_ one: String, _ two: String) -> String {
    let oneArray = Array(one)
    let twoArray = Array(two)
    
    var result = ""
    var carriedNumber = false
    
    for i in (0..<oneArray.count - 1).reversed() {
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
    
    if result.last == "0" && carriedNumber {
        let range = result.index(result.endIndex, offsetBy: -1)..<result.endIndex
        result.replacingCharacters(in: range, with: "1")
    }
    
    return String(result.reversed())
}

sum("100101", "001101") // 110010
sum("0010", "0010") // 0100
sum("111111", "111111") // 1111110
