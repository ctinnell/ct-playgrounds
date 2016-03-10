import Foundation

var input = ["3","1 1 2"]
var row = 0

func readLineAsInt() -> Int {
    let value = Int(input[row])!
    row = row + 1
    return value
}
func readLineAsIntArray() -> [Int] {
    let value = input[row].characters.split(" ").map(String.init).map({Int($0)!})
    row = row + 1
    return value
}


let numIntegers = readLineAsInt()
let integers = readLineAsIntArray()
var value = 0

for integer in integers {
    if integers.filter({$0 == integer}).count == 1 {
        value = integer
        break
    }
}

print(value)