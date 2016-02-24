func isDecentNumber(numberString: String) -> Bool {
    let numberOfThrees = numberString.characters.filter({$0 == "3"}).count
    let numberOfFives = numberString.characters.filter({$0 == "5"}).count
    
    return ((numberOfThrees % 5 == 0) && (numberOfFives % 3 == 0))
}

func initialNumberString(numDigits: Int) -> String {
    var numberString = ""
    for var x=0; x<numDigits; x++ {
        numberString = numberString + "5"
    }
    return numberString
}

func largestDecentNumber(numDigits: Int) -> String {
    var decentNumber = "-1"
    var numberString = initialNumberString(numDigits)
    
    if isDecentNumber(numberString) {
        return numberString
    }
    
    var startIndex = numberString.endIndex.advancedBy(-1)
    var endIndex = numberString.endIndex
    
    for var x=numDigits-1; x>=0; x-- {
        
        if x<numDigits-1 {
            startIndex = startIndex.advancedBy(-1)
            endIndex = endIndex.advancedBy(-1)
        }
        let range = Range(start: startIndex, end: endIndex)
        numberString.replaceRange(range, with: "3")
        if isDecentNumber(numberString) {
            return numberString
        }
    }
    return decentNumber
}

let number = largestDecentNumber(12002)
print(number)

