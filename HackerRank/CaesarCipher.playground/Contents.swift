let str = "ABCD"
let char = String(str[str.startIndex]).unicodeScalars
let char2 = Character(UnicodeScalar(67))
let scalar = UnicodeScalar("A")
let scalar2 = UnicodeScalar("s")

// 65 - 122

let text = "middle-Outz"
let iterator = 2

var cipher = ""

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








