import UIKit


var list: Dictionary<String, [String]> = [
    "Vegetables" : [ "Carrot", "Potato" ],
    "Fruit" : [ "Apple", "Orange", "Banana" ]
]

// filter Dictionary with for enumaration
var newList: [String] = []
for (key, array) in list {
    list[key] = array.filter { if($0.rangeOfString("o")) {return true}; return false }
    
}
list


// same filter with defining map extension on dictionary (functional approach)
extension Dictionary {
    func map(f: (KeyType, ValueType) -> ValueType) -> [KeyType:ValueType] {
        var ret = [KeyType:ValueType]()
        for (key, value) in self {
            ret[key] = f(key, value)
        }
        return ret
    }
}

var filteredList = list.map { $1.filter { if($0.rangeOfString("o")) {return true}; return false } }


filteredList

// anyObject vs Any
var t: AnyObject
t = 1
t = Int(1)
t = Double(1)
t = "rerer"
// Tuple possible only with Any
//t = ("wewe", "dsds")



// Optianal
var paremters: [String]?

paremters = nil

if paremters {
    var nonNilParameter = paremters!
    // immutable value
    //(paremters!).append("eee")
    nonNilParameter.append("erere")
    
}

var parameters:[String: Any] = ["mykey": ""]

parameters["dsds"] = "dssd"

parameters


