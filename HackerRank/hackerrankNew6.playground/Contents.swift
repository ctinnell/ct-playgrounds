func isDecentNumber(num3s: Int, num5s: Int) -> Bool {
    return ((num3s % 5 == 0) && (num5s % 3 == 0))
}

func numberString(num3s: Int, num5s: Int) -> String {
    var numberString = ""
    for var x=1; x<=num5s; x++ {
        numberString = numberString + "5"
    }
    for var x=1; x<=num3s; x++ {
        numberString = numberString + "3"
    }
    return numberString
}


func largestDecentNumber(initialNumber: Int) -> String {
    var num3s = 0
    var num5s = initialNumber
    var decentNumber = ""
    
    for var x=1; x<=initialNumber+1; x++ {
        if isDecentNumber(num3s, num5s: num5s) {
            decentNumber = numberString(num3s, num5s: num5s)
            break
        }
        num5s = num5s - 1
        num3s = num3s + 1
    }
    
    return (decentNumber == "") ? "-1" : decentNumber
}

let initialNumber = 12002
let number = largestDecentNumber(initialNumber)
print(number)

