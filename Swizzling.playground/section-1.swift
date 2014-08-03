// Playground - noun: a place where people can play

import UIKit

// Only needed until we have class variables
var __SwizzleSayHello = { (who:String) -> String in
    return "Hello, \(who)"
}

class Swizzle {
    //Only needed until we have class variables
    class var _sayHello : (String)->String { get{ return __SwizzleSayHello } set (swizzle) {__SwizzleSayHello = swizzle} }
    
    func sayHello(who:String)->String{
        return Swizzle._sayHello(who)
    }
}

let immutableInstance = Swizzle()
var mutableInstance = Swizzle()

//Both print "Hello, World"
println(immutableInstance.sayHello("World"))
println(mutableInstance.sayHello("World"))

Swizzle._sayHello = { (who:String) -> String in
    return "Howdy, \(who)"
}

//Both print "Howdy, World"
println(immutableInstance.sayHello("World"))
println(mutableInstance.sayHello("World"))
