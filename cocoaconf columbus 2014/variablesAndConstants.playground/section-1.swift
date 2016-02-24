let person = "Attendee"

func greetingForLocation (location: String) -> (String) -> String {
    
    func locationGreeting(name: String) -> String {
        return "\(name), welcome to \(location)"
    }
    
    return locationGreeting
    
}

let columbus = greetingForLocation("Columbus")
let lasVegas = greetingForLocation("Las Vegas")

func welcome(personNamed name:String,
    withMessage greeting:(String) -> String) -> String {
        
    return greeting(name)
}

welcome(personNamed: "Joe", withMessage: columbus)

columbus(person)
lasVegas(person)