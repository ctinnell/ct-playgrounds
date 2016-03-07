import Foundation

let str1 = "We promptly judged antique ivory buckles for the next prize"
let str2 = "We promptly judged antique ivory buckles for the prize"

func isPanagram(str: String) -> Bool {
    let lowerCaseLetters = ["a","b","c","d","e","f","g","h","i",
        "j","k","l","m","n","o","p","q","r","s","t","u","v","w",
        "x","y","z"]

    let uniquestr = str.characters
    let strArray = Array(Set(uniquestr)).map({String($0).lowercaseString})
    let onlyLetters = Array(Set(strArray).intersect(lowerCaseLetters)).sort()
    return onlyLetters == lowerCaseLetters
}

func panagramDescription(isPan: Bool) -> String {
    return isPan ? "panagram" : "not panagram"
}

print(panagramDescription(isPanagram(str1)))

print(panagramDescription(isPanagram(str2)))




