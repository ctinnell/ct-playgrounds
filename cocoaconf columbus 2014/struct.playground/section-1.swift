import Foundation

prefix operator √ {} // option - v

prefix func √ (argument:Double) -> Double {
    return sqrt(argument)
}

postfix operator ** {}

postfix func ** (number:Double) -> Double {
    return number * number
}

struct Vertex {
    var x, y: Double
    var magnitude: Double {
        return √(x** + y**)
    }
    
    mutating func moveByX(x:Double, y:Double) {
        self.x += x
        self.y += y
    }
}

var point = Vertex(x: 3.0, y: 4.0)
point.moveByX(100, y: 100)
point.magnitude

point.x

point.x = -5.0


var anotherPoint = point
anotherPoint.x = 65

anotherPoint
point