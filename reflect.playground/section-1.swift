// Playground - noun: a place where people can play

import UIKit

class Vegetable {
    var name: String?
    init(veg:String) {
        name = veg
    }
}
// Let's define a basic Swift class.
class Fruit {
    var type=1
    var name="Apple"
    var delicious=true
    var veg:Vegetable?
}
var fruit = Fruit()
let vegetable = Vegetable(veg: "rr")
fruit.veg = vegetable

fruit

let array = reflect(fruit)
array


// We can get at some info about an instance of an object using reflect(), which returns a Mirror.
reflect(fruit).count
reflect(fruit)[1].0
reflect(fruit)[1].1.summary
reflect(fruit)[3].0
let object = reflect(fruit)[3].1.summary

reflect(object).count


// Dump a bunch of info about the object using reflection.
dump(Fruit())

// Let's make an instance and print all its properties to the console.
var theFruit = fruit

for var index=0; index<reflect(theFruit).count; ++index {
    println(reflect(theFruit)[index].0 + ": "+reflect(theFruit)[index].1.summary)
}
