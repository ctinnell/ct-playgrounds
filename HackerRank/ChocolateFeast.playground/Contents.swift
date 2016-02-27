struct Input {
    let dollars: Int
    let cost: Int
    let wrappers: Int
    
    init(input: [Int]) {
        dollars = input[0]
        cost = input[1]
        wrappers = input[2]
    }
}

let numTestCases = 3
let inputs = [[10,2,5], [12,4,4],[6,2,2]]

for input in inputs {
    let i = Input(input: input)
    var numChocolates = i.dollars / i.cost
    var dollarsRemaining = i.dollars % i.cost
    var remainingWrappers = numChocolates
    var additionalChocolates = 0
    while remainingWrappers >= i.wrappers {
        var chocolatesToAdd = remainingWrappers / i.wrappers
        additionalChocolates = additionalChocolates + chocolatesToAdd
        remainingWrappers = remainingWrappers - (chocolatesToAdd * i.wrappers)
        remainingWrappers = remainingWrappers + chocolatesToAdd
    }
    numChocolates = numChocolates + additionalChocolates
    print(numChocolates)
}