import Darwin

func isSquare(number: Int) -> Bool {
    let root = sqrt(Double(number))
    return (Double((Int(root))) == root) ? true : false
}

func numSquares(startNumber: Int, endNumber: Int) -> Int {
    var numsquares = 0
    for var num in startNumber...endNumber {
        if isSquare(num) {
            numsquares = numsquares + 1
        }
    }
    return numsquares
}

let inputs = [3,9]
let numberOfSquares = numSquares(inputs[0], endNumber: inputs[1])
print(numberOfSquares)
