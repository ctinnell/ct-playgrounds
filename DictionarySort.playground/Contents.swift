//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let dictionary = ["C":"1","A":"3","B":2]
print(dictionary)
let sortedDictionary = dictionary.sort {$0.0 < $1.0}
print(sortedDictionary)



