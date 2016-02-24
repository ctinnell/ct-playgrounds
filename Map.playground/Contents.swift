//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var array1 = ["hello", "clay"]
var array2 = array1

array2.removeLast()
print(array1)
print(array2)
pop(array2)
print(array2)


func pop(var array: [String]) {
    array.removeLast()
}