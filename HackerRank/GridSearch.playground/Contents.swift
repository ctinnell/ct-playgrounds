import Foundation


var row = 0
let input = ["2",
    "10 10",
    "7283455864",
    "6731158619",
    "8988242643",
    "3830589324",
    "2229505813",
    "5633845374",
    "6473530293",
    "7053106601",
    "0834282956",
    "4607924137",
    "3 4",
    "9505",
    "3845",
    "3530",
    "15 15",
    "400453592126560",
    "114213133098692",
    "474386082879648",
    "522356951189169",
    "887109450487496",
    "252802633388782",
    "502771484966748",
    "075975207693780",
    "511799789562806",
    "404007454272504",
    "549043809916080",
    "962410809534811",
    "445893523733475",
    "768705303214174",
    "650629270887160",
    "2 2",
    "99",
    "99"]
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
func readLineAsString() -> String {
    let value = input[row]
    row = row + 1
    return value
}

func nextMatrix() -> [String] {
    let rowsAndColumns = readLineAsIntArray()
    let numberOfRows = rowsAndColumns[0]
    var matrix = [String]()
    for var x=0; x<numberOfRows; x++ {
        matrix.append(readLineAsString())
    }
    return matrix
}

func locateString(stringToLocate: String, baseString: String) -> [Range<String.Index>] {
    var startIndex = baseString.startIndex
    let endIndex = baseString.endIndex
    var endOfString = false
    var results = [Range<String.Index>]()
    
    while !endOfString {
        if let foundRange = baseString.rangeOfString(stringToLocate, options: .LiteralSearch, range: Range(start: startIndex, end: endIndex), locale: nil) {
            print(foundRange)
            results.append(foundRange)
            if foundRange.endIndex == baseString.endIndex {
                endOfString = true
            }
            else {
                startIndex = foundRange.endIndex
            }
        }
        else {
            endOfString = true
        }
     }
    
    return results
}

func matrixContainsPattern(matrix: [String], pattern: [String]) -> Bool {
    // quick check to verify that pattern is smaller than matrix
    guard pattern.count <= matrix.count && pattern[0].characters.count <= matrix[0].characters.count else { return false }
    var containsPattern = false
    
    let firstPatternLine = pattern[0]
    for var x=0;x<matrix.count;x++ {
        let matrixLine = matrix[x]
        

    }
    
    return containsPattern
}

let numberOfTests = readLineAsInt()
for var x=0; x<numberOfTests; x++ {
    let matrix = nextMatrix()
    let pattern = nextMatrix()
    let containsPattern = matrixContainsPattern(matrix, pattern: pattern)
    print(containsPattern ? "YES" : "NO")
}
