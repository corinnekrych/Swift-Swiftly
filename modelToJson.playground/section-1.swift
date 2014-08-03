// Playground - noun: a place where people can play

import UIKit
// from this gist
// https://gist.github.com/mchambers/67640d9c3e2bcffbb1e2

// Here we'll use Swift's IDE-supporting reflect()
// function to build a basic JSON serializer.

// Per the fine engineers at WWDC, Swift's reflection support
// exists purely to support the IDE and the Playground. But
// we can have some fun with it anyway. ;)

class SerializerBase {
}

class BaseFruit: SerializerBase {
}

class FruitBasket: SerializerBase {
    let banana=Banana()
    let apple=Apple()
    let grape=Grape()
}

class Grape: BaseFruit {
    var name="Grape"
}

class Banana: BaseFruit {
    var name="Banana"
    var fruitType=2
    var delicious=false
    var nutrients:Array<String>=["potassium"]
}

class Apple: BaseFruit {
    var fruitType=1
    var name="Apple"
    var delicious=true
}

var modelOut = Dictionary<NSString, Any>()

var theFruitBasket=FruitBasket()

func nsValueForAny(anyValue:Any) -> NSObject? {
    switch(anyValue) {
    case let intValue as Int:
        return NSNumber(int: CInt(intValue))
    case let doubleValue as Double:
        return NSNumber(double: CDouble(doubleValue))
    case let stringValue as String:
        return stringValue as NSString
    case let boolValue as Bool:
        return NSNumber(bool: boolValue)
    case let fruitValue as SerializerBase:
        return toDictionary(fruitValue)
    case let primitiveArrayValue as Array<String>:
        return primitiveArrayValue as NSArray
    case let primitiveArrayValue as Array<Int>:
        return primitiveArrayValue as NSArray
    case let objectArrayValue as Array<SerializerBase>:
        // this be a tricky one
        return NSNull()
    default:
        return nil
    }
}

func toDictionary(model:SerializerBase) -> NSMutableDictionary {
    var modelDictionary:NSMutableDictionary=NSMutableDictionary()
    
    for var index=0; index<reflect(model).count; ++index {
        let key=reflect(model)[index].0
        let value=reflect(model)[index].1.value
        
        if key=="super" && index==0 {
            // if the first key is super, we should probably skip it
            // because it's most likely the reflector telling us the
            // superclass of this model
            // we'll need to handle this separately
            
            // right now the else is only giving us the K/Vs from
            // the current class. we need to also find a way to get
            // them from the base class.
            
        }
        else {
            if let nsValue=nsValueForAny(value) {
                modelDictionary.setValue(nsValue, forKey: key)
            }
        }
    }
    
    return modelDictionary
}

let modelDictionary = toDictionary(theFruitBasket)

let modelJsonData:NSData = NSJSONSerialization.dataWithJSONObject(modelDictionary, options: NSJSONWritingOptions.PrettyPrinted, error: nil)

let modelJsonString = NSString(data: modelJsonData, encoding: NSUTF8StringEncoding)
modelJsonString
println(modelJsonString)
