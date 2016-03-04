import Foundation

func rangeFromNSRange(nsRange: NSRange, str: String) -> Range<String.Index>? {
    let from16 = str.utf16.startIndex.advancedBy(nsRange.location, limit: str.utf16.endIndex)
    let to16 = from16.advancedBy(nsRange.length, limit: str.utf16.endIndex)
    if let from = String.Index(from16, within: str),
        let to = String.Index(to16, within: str) {
            return from ..< to
    }
    return nil
}

func locate(stringToLocate: String, baseString: String) -> [Range<String.Index>] {
    var ranges = [Range<String.Index>]()
    
    do {
        // Create the regular expression.
        let regex = try NSRegularExpression(pattern: stringToLocate, options: [])
        
        // Use the regular expression to get an array of NSTextCheckingResult.
        // Use map to extract the range from each result.
        ranges = regex.matchesInString(baseString, options: [], range: NSMakeRange(0, baseString.characters.count)).map({rangeFromNSRange($0.range, str: baseString)!})
    }
    catch {
        // There was a problem creating the regular expression
        ranges = []
    }
    
    return ranges
}

let results = locate("11111", baseString: "111111111111111")
print(results)

