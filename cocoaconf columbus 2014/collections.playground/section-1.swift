var places = ["Columbus","Las Vegas","Seattle"]

for (index,place) in enumerate(places) {
    println("\(index) = \(place) ")
}

func greetingForLocation(location:String) -> (String) -> String {
    func locationGreeting(name:String) -> String {
        return "\(name), welcome to \(location)"
    }
    return locationGreeting
}

//var greetings = [ greetingForLocation(places[0]) , greetingForLocation(places[2]), greetingForLocation(places[2])]

var greetings = places.map{(greetingForLocation($0))}

greetings[1]("CocoConf")

