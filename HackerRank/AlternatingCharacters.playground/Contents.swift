var input = ["5","AAAA","BBBBB","ABABABAB","BABABA","AAABBB"]
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

let numTests = readLineAsInt()

for x in 0..<numTests {
    let letters = readLineAsString()
    print(letters)
    var deleteCount = 0
    var prevLetter = letters.characters.first!
    for (index,character) in letters.characters.enumerate() {
        if index > 0 {
            if character == prevLetter {
                deleteCount = deleteCount + 1
            }
            else {
                prevLetter = character
            }
        }
    }
    print(deleteCount)
}


