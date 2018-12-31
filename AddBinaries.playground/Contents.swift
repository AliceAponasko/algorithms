import UIKit

func sum(_ firstNumber: String, _ secondNumber: String) -> String {
    let firstArray = Array(firstNumber)
    let secondArray = Array(secondNumber)
    
    var result = ""
    var carriedNumber = false
    
    for i in (0..<firstArray.count - 1).reversed() {
        if firstArray[i] == "0" && secondArray[i] == "0" {
            result += carriedNumber ? "1" : "0"
            carriedNumber = false
        } else if firstArray[i] == "1" && secondArray[i] == "1" {
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
