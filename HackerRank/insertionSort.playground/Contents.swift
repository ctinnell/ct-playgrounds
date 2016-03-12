import Foundation

var numbers = [2,4,6,8,3]
numbers = [12,34,56, 1]
numbers = [2,3,4,5,6,7,8,9,10,1]
var startingIndex = numbers.count-2
var compareValue = numbers[numbers.count-1]

if numbers.count > 1 {
    for index in (0...startingIndex).reverse() {
        if compareValue<numbers[index] {
            //print(compareValue,"<",numbers[index])
            //print("index ",index)
            numbers[index+1] = numbers[index]
            print(numbers.map({String($0)}).joinWithSeparator(" "))
        }
        else {
            numbers[index+1] = compareValue
            print(numbers.map({String($0)}).joinWithSeparator(" "))
            break
        }
        
        if index == 0 {
            numbers[index] = compareValue
            print(numbers.map({String($0)}).joinWithSeparator(" "))
        }
    }
}