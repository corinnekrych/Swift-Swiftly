// Playground - noun: a place where people can play

import UIKit

var str:NSString = "http://www.test.com/?toto=titi&foo=bar"

let parameterStart = str.rangeOfString("?", options: NSStringCompareOptions.CaseInsensitiveSearch)
let subStr = str.substringFromIndex(parameterStart.location + 1)
let parameters = subStr.componentsSeparatedByString("&").map({$0.componentsSeparatedByString("=")})


let params = str.componentsSeparatedByString("?")[1].componentsSeparatedByString("&").map({$0.componentsSeparatedByString("=")})
var dict = [String:String]()
for elt in params {
    NSLog("\(elt[0]) \(elt[1])")
    let key:String = elt[0] as String
    dict[key] = elt[1] as String
}

dict
NSJSONSerialization.dataWithJSONObject(dict, options: nil, error: nil)


//let dict = params.map({[$0[0]:$0[1]]})

//        if(request.HTTPMethod == "GET") {
//            let params = request.URL.absoluteString.componentsSeparatedByString("?")[1].componentsSeparatedByString("&").map({$0.componentsSeparatedByString("=")})
//            var dict = [String:String]()
//            for elt in params {
//                if let value = elt[1] {
//                let key:String = elt[0] as String
//                dict[key] = elt[1] as String
//                }
//            }
//
//            NSJSONSerialization.dataWithJSONObject(dict, options: nil, error: nil)
//
//
//        }


let numbers = [1,2,3]
let squares = numbers.map { $0 * $0 }
let odds    = numbers.filter { $0 % 2 == 1 }
let sum     = numbers.reduce(0) { $0 + $1 }

sum

let array = ["1", "2", "3"]
let myStr = array.reduce("", { $0 + $1})
myStr





