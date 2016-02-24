func isDecentNumber(number: Int) -> Bool {
    let numberOfThrees = String(number).characters.filter({$0 == "3"}).count
    print(numberOfThrees)
    let numberOfFives = String(number).characters.filter({$0 == "5"}).count

    return ((numberOfThrees % 5 == 0) && (numberOfFives % 3 == 0))
}

func initialNumber(numDigits: Int) -> Int {
    var numberString = ""
    for var x=0; x<numDigits; x++ {
        numberString = numberString + "5"
        print(numberString + "\n\n")
    }
    return (Int(numberString)!)
}

func largestDecentNumber(numDigits: Int) -> Int {
    var decentNumber = -1
    var number: Int = initialNumber(numDigits)
    var factor = 2
    
    for var x=numDigits; x>=0; x-- {
        if isDecentNumber(number) {
            decentNumber = number
            break
        }
        number = number - factor
        factor = factor * 10
        print(factor)
    }
    return decentNumber
}

let number = largestDecentNumber(2194)
