import Foundation

var input = ["3","2147483647","1","0"]
var row = 0

func readLineAsInt() -> Int {
    let value = Int(input[row])!
    row = row + 1
    return value
}

for index in 0..<readLineAsInt() {
    let integer = readLineAsInt()
    let integerString = String(integer, radix:2)
    let paddedvalues = String(count: (32 - integerString.characters.count), repeatedValue: Character("0")) //repeat a character
    let string = paddedvalues + integerString
    let flippedString = string.characters.map({($0 == "0") ? "1" : "0"}).joinWithSeparator("")
    
    let flippedInt = Int(flippedString, radix: 2)
    print(flippedInt!)
}

