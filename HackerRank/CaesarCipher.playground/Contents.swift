import Foundation
let str = "ABCD"
let char = String(str[str.startIndex]).unicodeScalars
let char2 = Character(UnicodeScalar(67))
let scalar = UnicodeScalar("_")
let scalar2 = UnicodeScalar("s")


enum CharacterType {
    case UpperCase
    case LowerCase
    case NotALetter

    static let upperCaseLetters = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    static let lowerCaseLetters = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

    init(char: Character) {
        var type = CharacterType.NotALetter
        
        if CharacterType.upperCaseLetters.filter({$0 == String(char)}).count > 0 {
            type = .UpperCase
        }
        else if CharacterType.lowerCaseLetters.filter({$0 == String(char)}).count > 0 {
            type = .LowerCase
        }
        self = type
    }
    
    func advanceCharacter(charValue: Int, advanceBy: Int) -> Int {
        guard (self == .UpperCase || self == .LowerCase) else {return charValue}
        
        var newIndex = charValue
        for var x=1; x<=advanceBy; x++ {
            let letter = String(Character(UnicodeScalar(newIndex)))
            if letter == CharacterType.upperCaseLetters.last {
                newIndex = Int(UnicodeScalar("A").value)
            }
            else if letter == CharacterType.lowerCaseLetters.last {
                newIndex = Int(UnicodeScalar("a").value)
            }
            else {
                newIndex = newIndex + 1
            }
            
        }
        return newIndex
    }
}

let text = "middle-Outz"
let iterator = 2

var cipher = ""

for textChar in text.unicodeScalars {
    var newCharacter = Character(textChar)
    let characterType = CharacterType(char: Character(textChar))
    let advanceBy = characterType.advanceCharacter(Int(textChar.value), advanceBy: iterator)
    newCharacter = Character(UnicodeScalar(advanceBy))
    cipher = cipher + String(newCharacter)
}

print(cipher)
/*
for textChar in text.unicodeScalars {
    var newCharacter = Character(textChar)
    if textChar.value >= 65 && textChar.value <= 122 {
        var newVal = textChar.value.advancedBy(iterator)
        
        if textChar.value == 122 && iterator > 0 {
            newVal = textChar.value.advancedBy(-26)
            newVal = newVal.advancedBy(iterator)
        }
        else if textChar.value == 115 && iterator > 0 {
            newVal = textChar.value.advancedBy(-52)
            newVal = newVal.advancedBy(iterator)
        }
        newCharacter = Character(UnicodeScalar(newVal))
    }
    cipher = cipher + String(newCharacter)
}

print(cipher)
*/







