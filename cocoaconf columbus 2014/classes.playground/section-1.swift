import UIKit

enum CocoaConfTutorials: String {
    case GameDevelopment = "Game Dev"
    case AVFoundation = "AV Foundation"
    case Swift = "Swift", AllDayiOS = "iOS"
    
    var name: String {
        return self.toRaw()
    }
}

var tutorial = CocoaConfTutorials.Swift
tutorial = .AllDayiOS
//tutorial = .AVFoundation


switch tutorial {
case .Swift, .AllDayiOS:
    println("What a great choice")
default:
    println("Whatever")
}

tutorial.name


protocol Snackable {
    func canEatServings(thisMany:Int, ofThisFood:String) -> String
}


class CocoaConfAttendee {
    var name, hometown: String
    
    init(name:String, hometown:String) { //designated initializer
        //println("superclass before")

        self.name = name
        self.hometown = hometown
        //println("superclass after")

    }
    
    convenience init() {
        self.init(name:"Your name here", hometown:"AnyTown")
    }
    
    func nameBadge() -> String {
        return "Hello, I'm \(name) from \(hometown)"
    }
}

extension CocoaConfAttendee: Snackable {
    func canEatServings(thisMany:Int, ofThisFood:String) ->String {
        return "can eat \(thisMany) of \(ofThisFood)"
    }

}
//let clay = CocoaConfAttendee(name:"Clay", hometown:"Florence, Ky")
//
//let dawn = CocoaConfAttendee(name:"Dawn", hometown:"Florence, Ky")

//clay.nameBadge()
//dawn.nameBadge()
//
//let boring = CocoaConfAttendee()
//
//
//clay

class CocoaConfTutorialAttendee: CocoaConfAttendee {
    
    var tutorial:CocoaConfTutorials
    
    init(name: String, hometown: String, tutorial: CocoaConfTutorials) {
        //println("subclass before")
        self.tutorial = tutorial
        super.init(name: name, hometown: hometown)
        //println("subclass after")
    }
    
    override func nameBadge() -> String {
        return super.nameBadge() + "  I'm in the \(tutorial.name) tutorial"
    }
}

let tutorialAttendee = CocoaConfTutorialAttendee(name: "Clay", hometown: "Florence, Ky", tutorial: CocoaConfTutorials.Swift)

tutorialAttendee.nameBadge()

tutorialAttendee.canEatServings(10, ofThisFood: "cookies")



