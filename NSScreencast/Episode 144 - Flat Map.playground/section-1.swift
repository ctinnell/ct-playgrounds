import UIKit

class Box<T> {
    var unbox: T
    init(_ value: T) {
        unbox = value
    }
}

enum Result<T> {
    case Success(Box<T>)
    case Error(String)
    
    func map<U>(transform: T -> U) -> Result<U> {
        switch self {
        case .Success(let value):
            return .Success(Box(transform(value.unbox)))
        case .Error(let error):
            return .Error(error)
        }
    }
}

//func divide(x: Int, y: Int) -> Result<Float> {
//    if y < 0 {
//        return .Error("Divide by zero")
//    }
//    else {
//        return .Success(Box(Float(x) / Float(y)))
//    }
//}
//
//func compute(input: Float) -> Result<Float> {
//    if input < 0 {
//        return .Error("negative")
//    }
//    return .Success(Box(log(input)))
//}
//
//switch divide(12, 2).map(compute) {
//case .Success(let value): value.unbox
//case .Error (let error): error
//}

var names = ["Alice","Bob","Charlie"]
var counts = names.map(countElements)


let domains = ["apple.com","google.com","ctinnell.net"]
var urls = [NSURL]()
for domain in domains {
    urls.append(NSURL(scheme: "http", host: domain, path: "/")!)
}
urls

let mapped = domains.map{NSURL(scheme: "http", host: $0, path: "/")!}
mapped













