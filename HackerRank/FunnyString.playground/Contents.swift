import Foundation

let input = ["2","acxz","bcxz"]
var row = 0

func readLineAsInt() -> Int {
    let value = Int(input[row])!
    row = row + 1
    return value
}

func readLineAsString() -> String {
    let value = input[row]
    row = row + 1
    return value
}

var numTests = readLineAsInt()
for var x=0; x<numTests; x++ {
    print(readLineAsString())
}
