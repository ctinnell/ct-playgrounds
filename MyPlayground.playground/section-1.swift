// Playground - noun: a place where people can play

import UIKit

let shareholder1 = ["shareholder":"Leo Holbeck", "sharePct":".333"]
let shareholder2 = ["shareholder":"Barb Holbeck", "sharePct":".339"]

let shareholders = [shareholder1,shareholder2]
var list = ""
for (index, shareholder) in enumerate(shareholders) {
    list = index > 0 ? list + ", " : list
    let shareholdername = shareholder["shareholder"]
    let shareholderPct = shareholder["sharePct"]
    list += "\(shareholdername) (\(shareholderPct))"
}

println(list)

