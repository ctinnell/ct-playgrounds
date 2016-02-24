//: Playground - noun: a place where people can play

import UIKit
import Foundation

var str = "Hello, playground"


let fileManager = NSFileManager.defaultManager()
let documentsDirectory = "/Users/Application/524FBCF6-FEED-4B98-A1B0-9A05ED5621D9/Documents"

func filePath(fileName: String) -> String {
    return documentsDirectory + "/" + fileName
    /*
    let url = NSURL(fileURLWithPath: documentsDirectory)
    
    return url.URLByAppendingPathComponent(fileName).description*/
}


func duplicateFile(fileName: String) {
    let oldFilePath = filePath(fileName)
    if let fileNameWithoutExtension = NSURL(fileURLWithPath: oldFilePath).URLByDeletingPathExtension {
        for x in 1...10 {
            do {
                var oldFileName = NSURL(fileURLWithPath: oldFilePath).description.stringByRemovingPercentEncoding
                var newFileName = (fileNameWithoutExtension.description + "-\(x).pdf").stringByRemovingPercentEncoding
                oldFileName = oldFileName!.stringByReplacingOccurrencesOfString("file://", withString: "")
                
                //try fileManager.copyItemAtPath(oldFilePath, toPath: newFileName )
                break
            } /*catch let error1 as NSError {
                var error: NSError?
                error = error1
            }*/
        }
    }
}

func scrubFileURLString(urlString: String) -> String? {
    return urlString.stringByRemovingPercentEncoding?.stringByReplacingOccurrencesOfString("file://", withString: "")
}

duplicateFile("This File Name Is Long.pdf")

let fileString = "Application And Policy Transfer-08-45-24-1.pdf"
let str1 = NSURL.fileURLWithPath(fileString)
let str2 = fileString.stringByReplacingOccurrencesOfString(".pdf", withString: "").stringByReplacingOccurrencesOfString(".PDF", withString: "")
let stringWithoutExtension = scrubFileURLString((NSURL(fileURLWithPath:fileString).URLByDeletingPathExtension?.description)!)