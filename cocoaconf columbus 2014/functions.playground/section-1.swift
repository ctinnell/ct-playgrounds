
extension Array {
    mutating func emphasize(modificationOf:(T) -> T) {
            for i in 0..<self.count {
                self[i] = modificationOf(self[i])
            }
    }
}

var numbers = [5,2,8,3,9,4]

//func emphasize(inout array:[Int],
//            modificationOf:(Int) -> Int) -> [Int] {
//    for i in 0..<array.count {
//        array[i] = modificationOf(array[i])
//    }
//    return array
//}

//func times100(number:Int) -> Int {
//    return number * 100
//}

numbers
func emphasize<T>(inout array:[T],
    modificationOf:(T) -> T) -> [T] {
        for i in 0..<array.count {
            array[i] = modificationOf(array[i])
        }
        return array
}

//emphasize(&numbers, {number in number * 100})

//emphasize(&numbers) { $0 * 100 }

var doubles = [5.0, 2.0, 8.0, 3.0]
emphasize(&doubles) { $0 * 100 }
doubles

var places = ["Columbus", "Las Vegas", "Seattle"]
//emphasize(&places){ $0 + ", baby!"}
//places

var mutatedPlaces = places.map({ $0 + ", baby!" })
mutatedPlaces

places.emphasize({ $0 + ", baby!" })
places
