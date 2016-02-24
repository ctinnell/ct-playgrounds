var numberString = "555"
let startIndex = numberString.endIndex.advancedBy(-1)
let endIndex = numberString.endIndex
let range = Range(start: startIndex, end: endIndex)
numberString.replaceRange(range, with: "3")


