var tourStops = ["August":"Columbus",
              "September":"Las Vegas",
                "October":"Seattle"]

tourStops["November"] = "Boston"

let month = "November"
if let possibleStop = tourStops[month] {
    possibleStop
}
else {
    println("no stop during \(month)")
}

