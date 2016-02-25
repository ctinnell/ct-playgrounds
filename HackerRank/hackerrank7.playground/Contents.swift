import Darwin

func numSquares(startNumber: Int, endNumber: Int) -> Int {
    let squareRootStart = sqrt(Double(startNumber))
    let squareRootEnd = sqrt(Double(endNumber))
    
    let startRoot = floor(squareRootStart)
    let endRoot = (ceil(squareRootEnd))
//    print("square root start = \(sqrt(Double(startNumber)))")
//    print("square root end = \(sqrt(Double(endNumber)))")
//    print("startRoot = \(startRoot)")
//    print("endRoot = \(endRoot)")
    var numsquares = ((endRoot-1) - startRoot)
    if squareRootStart == startRoot {
        numsquares = numsquares + 1
    }
    if squareRootEnd == endRoot {
        numsquares = numsquares + 1
    }
    
    return Int(numsquares)
}

var inputs = [465868129,988379794]
//inputs = [17,24]
//inputs = [3,9]
let numberOfSquares = numSquares(inputs[0], endNumber: inputs[1])
print(numberOfSquares)


