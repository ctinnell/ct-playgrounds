import Foundation

// Begin Challenge 1
var arr = ["1","2","3","4","10","11"]

var sum = 0


let intArr = arr.map({Int($0)!})


sum = arr.map({Int($0)!}).reduce(0, combine: {$0 + $1})

print(sum)
// End Challenge 1

// Begin Challenge 2
var arr2 = ["1000000001","1000000002","1000000003","1000000004","1000000005"]
sum = arr2.map({Int($0)!}).reduce(0, combine: {$0 + $1})
print(sum)
// End Challenge 2

// Begin Challenge 3
var arr3 = [[11,2,4],[4,5,6],[10,8,-12]]
var d1 = 0
var d2 = arr3[0].count-1
var d1Sum = 0
var d2Sum = 0

for var intArray in arr3 {
    d1Sum = d1Sum + intArray[d1]
    d2Sum = d2Sum + intArray[d2]
    d1 = d1 + 1
    d2 = d2 - 1
}

print(d1Sum)
print(d2Sum)
print (abs(d1Sum - d2Sum))

// End Challenge 3

let number = 9
let numberAsFloat = Float(number)
print(numberAsFloat)
let numberString = "9"
let stringAsInt = Int(numberString)

var dateString: String = "07:05:45PM"
/*
var end = dateString.endIndex
var endMinusTwo = dateString.endIndex.advancedBy(-2)
let range = Range(start: endMinusTwo, end: end)
dateString.removeRange(range)

var hour = dateString[dateString.startIndex..<dateString.startIndex.advancedBy(2)]
print(hour)
var dateWitoutHour = dateString[dateString.startIndex.advancedBy(2)..<dateString.endIndex]
*/

let inputDateFormatter = NSDateFormatter()
inputDateFormatter.dateFormat = "hh:mm:ssa"
if let date = inputDateFormatter.dateFromString(dateString) {
    let outputDateFormatter = NSDateFormatter()
    outputDateFormatter.dateFormat = "HH:mm:ss"
    
    let dateString = outputDateFormatter.stringFromDate(date)
}

let arrString = "1 2 3"
let str = arrString.characters.split(" ").map(String.init).map({Int($0)!})


func evaluateParticipation(participation: [Int], threshhold: Int) -> Bool {
    var counter = 0
    for var part in participation {
        if part > 0 {
            counter++
            if counter >= threshhold {
                break
            }
        }
    }
    return(!(counter>=threshhold))
}

let numTests = 5v
ar classStatus = [Bool]()

for var testNum=1; testNum<=numTests; testNum++ {
    let info = readLine()!.characters.split(" ").map(String.init).map({Int($0)!})
    let participation = readLine()!.characters.split(" ").map(String.init).map({Int($0)!})
    let threshhold = info[1]
    
    classStatus.append(evaluateParticipation(participation, threshhold:threshhold))
}

for status in classStatus {
    if status {
        print("YES")
    }
    else {
        print("NO")
    }
}

var string = "9"
let number9 = Int(string)





