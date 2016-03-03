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


func rangeFromNSRange(nsRange: NSRange, str: String) -> Range<String.Index>? {
    let from16 = str.utf16.startIndex.advancedBy(nsRange.location, limit: str.utf16.endIndex)
    let to16 = from16.advancedBy(nsRange.length, limit: str.utf16.endIndex)
    if let from = String.Index(from16, within: str),
        let to = String.Index(to16, within: str) {
            return from ..< to
    }
    return nil
}

func locate(stringToLocate: String, baseString: String) -> [Range<String.Index>] {
    var ranges = [Range<String.Index>]()
    
    do {
        // Create the regular expression.
        let regex = try NSRegularExpression(pattern: stringToLocate, options: [])
        
        // Use the regular expression to get an array of NSTextCheckingResult.
        // Use map to extract the range from each result.
        ranges = regex.matchesInString(baseString, options: [], range: NSMakeRange(0, baseString.characters.count)).map({rangeFromNSRange($0.range, str: baseString)!})
    }
    catch {
        // There was a problem creating the regular expression
        ranges = []
    }
    
    return ranges
}

func locateString(stringToLocate: String, baseString: String, stopAfterOne: Bool) -> [Range<String.Index>] {
    var startIndex = baseString.startIndex
    let endIndex = baseString.endIndex
    var endOfString = false
    print("1 in")
    var results = [Range<String.Index>]()
    print("1 out")
    
    while !endOfString {
        if let foundRange = baseString.rangeOfString(stringToLocate, options: .LiteralSearch, range: Range(start: startIndex, end: endIndex), locale: nil) {
            //print(foundRange)
            results.append(foundRange)
            if(stopAfterOne) {
                return results
            }
            if foundRange.endIndex == baseString.endIndex {
                endOfString = true
            }
            else {
                startIndex = foundRange.endIndex
                //startIndex.advancedBy(1)
            }
        }
        else {
            endOfString = true
        }
     }
    
    return results
}


func matrixStringContainsPatternString(matrixString: String, patternString: String, range: Range<String.Index>) -> Bool {
    //print("match2. matrixString = ",matrixString)
    let trimmedMatrixString = matrixString.substringWithRange(range)
    //print("match2. trimmedMatrixString = ",trimmedMatrixString)
    return locate(patternString, baseString: trimmedMatrixString).count > 0
    //return locateString(patternString, baseString: trimmedMatrixString, stopAfterOne: true).count > 0
}

func matrixContainsPattern(matrix: [String], pattern: [String]) -> Bool {
    // quick check to verify that pattern is smaller than matrix
    print("2 in")
    guard pattern.count <= matrix.count && pattern[0].characters.count <= matrix[0].characters.count else { return false }
    print("2 out")
    var containsPattern = false
    
    let firstPatternLine = pattern[0]
    for var x=0;x<matrix.count;x++ {
        print("3 in")
        let matrixLine = matrix[x]
        print("3 out")
//        let matches = locateString(firstPatternLine, baseString: matrixLine, stopAfterOne: false)
        let matches = locate(firstPatternLine, baseString: matrixLine)
        print("matched: \(matches.count)")
        for match in matches {
            print("match: ",match, " line: ",x)
            var matchCounter = 1
            var patternCounter = 1
            var matrixCounter = x+1
            for var y=1; y<pattern.count; y++ {

                if matrixCounter >= matrix.count {
                    break
                }
                /*print("4 in",y, pattern.count,matrixCounter, matrix.count, patternCounter, x)
                print("match. matrix[\(y)] =",matrix[matrixCounter]," patternString: ", pattern[patternCounter])
                print("4 out")*/
                if matrixStringContainsPatternString(matrix[matrixCounter], patternString: pattern[patternCounter], range: match) {
                    //print("match2. patternCounter: ", patternCounter, "y: ", y)
                    //print("match2. matrix[y] =",matrix[matrixCounter]," patternString: ", pattern[patternCounter])
                    //print("match2. range = ",match)
                    matchCounter = matchCounter + 1
                    print("matchCounter = ",matchCounter, "patterncount = ",pattern.count)
                    if matchCounter >= pattern.count {
                        return true
                    }
                    patternCounter = patternCounter + 1
                    matrixCounter = matrixCounter + 1
                }
                else {
                    break
                }
            }
        }

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

