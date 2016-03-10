import Foundation

var input = ["2","acxz","bcxz"]
input =
["10",
"jkotzxzxrxtzytlruwrxytyzsuzytwyzxuzytryzuzysxvsmupouysywywqlhg",
"eklrywzvpxtvoptlrskmskszvwzsuzxrtvyzwruqvyxusqwupnurqmtltnltsmuyxqoksyurpwqpv",
"efhpuvqvnuwpvwysvnunostvpqvxtxsvqwqvsxtxvqpvtsonunvsywvpwunvqvupxzy",
"otytmpszumnryqvxpvnvxyvpvprumnvsqwqwtsqyqksqvnuqpxszwzsxsx",
"bhmptlqswsvoqsvzyzwoqtvowpyqxpwurpxutswtrpwzvrpkswzuo",
"rvovprxzvwrxpwpzsltzutxztrxqxt",
"ceiosyrtztvnqsuozrxvtqywqwyrxtnjh",
"djnsyzxszryqworuxpqvqwquvotzsqvoupwvztzupowtqnvpxqyrwutzuys",
"kovzuywsuvwxuxtwzryzuxyvouvyskoqtwryszxqqxzsyrwtqoksyvuovyxuzyrzwtxuxwvuswuqvryu",
"ptvzstvotxqyvzrwyqryzrpkswzryupwutmigc"]

var row = 0

func readLineAsInt() -> Int {
    let value = Int(input[row])!
    row = row + 1
    return value
}

func readLineAsString() -> String {
    let value = input[row]
    row = row + 1
    return value
}

func asciValues(str: String) -> [Int] {
    var values = [Int]()
    for scalar in str.unicodeScalars {
        values.append(Int(scalar.value))
    }
    return values
}

func isFunnyString(s_string: String) -> Bool {
    var isFunny = false
    let r_string = String(s_string.characters.reverse())
    let s = asciValues(s_string)
    let r = asciValues(r_string)
    print("s.count ",s.count)
    for var j=1; j<s.count; j+=2 {
        print("j=",j)
        if abs(s[j]-s[j-1]) == abs(r[j]-r[j-1]) {
            isFunny = true
        }
        else {
            isFunny = false
            break
        }
    }
    return isFunny
}

var numTests = readLineAsInt()
for var x=0; x<numTests; x++ {
    let s_string = readLineAsString()
    print(isFunnyString(s_string) ? "Funny" : "Not Funny")
}
