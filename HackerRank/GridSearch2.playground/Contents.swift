import Foundation


var row = 0
var input = ["2",
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

input = ["1",
    "5 15",
    "111111111111111",
    "111111111111111",
    "111111011111111",
    "111111111111111",
    "111111111111111",
    "3 5",
    "11111",
    "11111",
    "11110"]


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

func fullPatternMatches(matrix: [String], locationOfFirstLineMatch: Int, pattern: [String]) -> Bool {
    var containsPattern = false
    
    return containsPattern
}

func matrixContainsPatternStartingAtLine(matrix: [String], matrixLine: Int, matrixColumn: Int, pattern: [String]) -> Bool {
    let matrixLineString = matrix[matrixLine]
    let start = matrixLineString.startIndex.advancedBy(matrixColumn)
    let end = start.advancedBy(pattern[0].characters.count - 1)
    let range = Range(start: start, end: end)
    return (matrixLineString.substringWithRange(range) == pattern[0])
}

func patternWidthCanStillFitInRemainingMatrix(matrix: [String], matrixColumn: Int, pattern: [String]) -> Bool {
    return (matrix[0].characters.count - (matrixColumn - 1)) >= pattern[0].characters.count
}

func patternHeightCanStillFitInRemainingMatrix(matrix: [String], matrixRow: Int, pattern: [String]) -> Bool {
    return (matrix.count - (matrixRow - 1)) >= pattern.count
}

func matrixContainsPattern(matrix: [String], pattern: [String]) -> Bool {
    guard pattern.count <= matrix.count && pattern[0].characters.count <= matrix[0].characters.count else { return false }
    
    var currentRow = 0
    var currentColumn = 0
    for currentRow = 0; currentRow<matrix.count; currentRow++ {
        guard patternHeightCanStillFitInRemainingMatrix(matrix, matrixRow: currentRow, pattern: pattern) else { return false }
        for currentColumn = 0; currentColumn < matrix[currentRow].characters.count; currentColumn++ {
            guard patternWidthCanStillFitInRemainingMatrix(matrix, matrixColumn: currentColumn, pattern: pattern) else { break }
            if matrixContainsPatternStartingAtLine(matrix, matrixLine: currentRow, matrixColumn: currentColumn, pattern: pattern) {
                if fullPatternMatches(matrix, locationOfFirstLineMatch: currentRow, pattern: pattern) {
                    return true
                }
            }
        }
    }
    
    return false
}

let numberOfTests = readLineAsInt()
for var x=0; x<numberOfTests; x++ {
    let matrix = nextMatrix()
    let pattern = nextMatrix()
    let containsPattern = matrixContainsPattern(matrix, pattern: pattern)
    print(containsPattern ? "YES" : "NO")
}

