import UIKit

//StringLiteralConvertible
final class MyDoubleDouble : FloatLiteralConvertible {
    var double : Double
    
    init(value: Double) {
        double = value * 2
    }
    
    class func convertFromFloatLiteral(value: Double) -> MyDoubleDouble {
        return MyDoubleDouble(value: value)
    }
}

let double = 2.0                        // double has a value of 2.0
let myDouble : MyDoubleDouble = 2.0


var jsonNonOpt:NSDictionary = [
    "stat": "ok",
    "vegetables": [
        "beans": [
            [
                "id" : 3,
                "name" : "Green beans",
                "isSummerVegetable" : true,
                "size": 2.3,
            ],
            [
                "id" : 4,
                "name" : "Red beans",
                "isSummerVegetable" : false,
                "size": 1.73,
            ]
        ]
    ]
]
let veggies: AnyObject? = jsonNonOpt["vegtables"]
veggies
let dict = jsonNonOpt as NSDictionary
let vegetables = dict["vegetables"] as [String: AnyObject]
let vegetablesItems : AnyObject = vegetables["beans"]!
let collection = vegetablesItems as [AnyObject]

for info : AnyObject! in collection {
    let vegInfo = info as [String: AnyObject]
    let id : AnyObject! = vegInfo["id"]
    let name : AnyObject! = vegInfo["name"]
    let isSummerVegetable : AnyObject! = vegInfo["isSummerVegetable"]
    let size : AnyObject! = vegInfo["size"]
    println("Vegetabe ID: \(id)")
    println("Vegetabe Name: \(name)")
    println("isSummerVegetable: \(isSummerVegetable)")
    println("size: \(size)")
}

/*
var json:NSDictionary? = [
    "stat": "ok",
    "vegetables": [
        "beans": [
            [
                "id" : 3,
                "name" : "Green beans",
                "isSummerVegetable" : true,
                "size": 2.3,
            ],
            [
                "id" : 4,
                "name" : "Red beans",
                "isSummerVegetable" : false,
                "size": 1.73,
            ]
        ]
    ]
]



if let dict = json as? NSDictionary {
    if let vegetables = dict["vegetables"] as? [String: AnyObject] {
        if let vegetablesItems : AnyObject = vegetables["beans"] {
            if let collection = vegetablesItems as? [AnyObject] {
                for info : AnyObject in collection {
                    if let vegInfo = info as? [String: AnyObject] {
                        let id : AnyObject? = vegInfo["id"]
                        let name : AnyObject? = vegInfo["name"]
                        let isSummerVegetable : AnyObject? = vegInfo["isSummerVegetable"]
                        let size : AnyObject? = vegInfo["size"]
                        
                        println("Vegetabe ID: \(id!)")
                        println("Vegetabe Name: \(name!)")
                        println("isSummerVegetable: \(isSummerVegetable!)")
                        println("size: \(size!)")
                    }
                }
            }
        }
    }
}
*/

//enum JSONValue {
//    
//    
//    case JNumber(NSNumber)
//    case JString(String)
//    case JBool(Bool)
//    case JNull
//    case JArray(Array<JSONValue>)
//    case JObject(Dictionary<String,JSONValue>)
//    case JInvalid(NSError)
//    
//    var string: String? {
//    switch self {
//    case .JString(let value):
//        return value
//    default:
//        return nil
//        }
//    }
//    
//    var url: NSURL? {
//    switch self {
//    case .JString(let value):
//        return NSURL(string: value)
//    default:
//        return nil
//        }
//    }
//    var number: NSNumber? {
//    switch self {
//    case .JNumber(let value):
//        return value
//    default:
//        return nil
//        }
//    }
//    
//    var double: Double? {
//    switch self {
//    case .JNumber(let value):
//        return value.doubleValue
//    case .JString(let value):
//        return (value as NSString).doubleValue
//    default:
//        return nil
//        }
//    }
//    
//    var integer: Int? {
//    switch self {
//    case .JBool(let value):
//        return Int(value)
//    case .JNumber(let value):
//        return value.integerValue
//    case .JString(let value):
//        return (value as NSString).integerValue
//    default:
//        return nil
//        }
//    }
//    
//    var bool: Bool? {
//    switch self {
//    case .JBool(let value):
//        return value
//    case .JNumber(let value):
//        return value.boolValue
//    case .JString(let value):
//        return (value as NSString).boolValue
//    default:
//        return nil
//        }
//    }
//    
//    var array: Array<JSONValue>? {
//    switch self {
//    case .JArray(let value):
//        return value
//    default:
//        return nil
//        }
//    }
//    
//    var object: Dictionary<String, JSONValue>? {
//    switch self {
//    case .JObject(let value):
//        return value
//    default:
//        return nil
//        }
//    }
//    
//    var first: JSONValue? {
//    switch self {
//    case .JArray(let jsonArray) where jsonArray.count > 0:
//        return jsonArray[0]
//    case .JObject(let jsonDictionary) where jsonDictionary.count > 0 :
//        let (_, value) = jsonDictionary[jsonDictionary.startIndex]
//        return value
//    default:
//        return nil
//        }
//    }
//    
//    var last: JSONValue? {
//    switch self {
//    case .JArray(let jsonArray) where jsonArray.count > 0:
//        return jsonArray[jsonArray.count-1]
//    case .JObject(let jsonDictionary) where jsonDictionary.count > 0 :
//        let (_, value) = jsonDictionary[jsonDictionary.endIndex]
//        return value
//    default:
//        return nil
//        }
//    }
//    
//    init (_ data: NSData!){
//        if let value = data{
//            var error:NSError? = nil
//            if let jsonObject : AnyObject = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &error) {
//                self = JSONValue(jsonObject)
//            }else{
//                self = JSONValue.JInvalid(NSError(domain: "JSONErrorDomain", code: 1001, userInfo: [NSLocalizedDescriptionKey:"JSON Parser Error: Invalid Raw JSON Data"]))
//            }
//        }else{
//            self = JSONValue.JInvalid(NSError(domain: "JSONErrorDomain", code: 1000, userInfo: [NSLocalizedDescriptionKey:"JSON Init Error: Invalid Value Passed In init()"]))
//        }
//        
//    }
//    
//    init (_ rawObject: AnyObject) {
//        switch rawObject {
//        case let value as NSNumber:
//            if String.fromCString(value.objCType) == "c" {
//                self = .JBool(value.boolValue)
//                return
//            }
//            self = .JNumber(value)
//        case let value as NSString:
//            self = .JString(value)
//        case let value as NSNull:
//            self = .JNull
//        case let value as NSArray:
//            var jsonValues = [JSONValue]()
//            for possibleJsonValue : AnyObject in value {
//                let jsonValue = JSONValue(possibleJsonValue)
//                if  jsonValue {
//                    jsonValues.append(jsonValue)
//                }
//            }
//            self = .JArray(jsonValues)
//        case let value as NSDictionary:
//            var jsonObject = Dictionary<String, JSONValue>()
//            for (possibleJsonKey : AnyObject, possibleJsonValue : AnyObject) in value {
//                if let key = possibleJsonKey as? NSString {
//                    let jsonValue = JSONValue(possibleJsonValue)
//                    if jsonValue {
//                        jsonObject[key] = jsonValue
//                    }
//                }
//            }
//            self = .JObject(jsonObject)
//        default:
//            self = .JInvalid(NSError(domain: "JSONErrorDomain", code: 1000, userInfo: [NSLocalizedDescriptionKey:"JSON Init Error: Invalid Value Passed In init()"]))
//        }
//    }
//    
//    subscript(index: Int) -> JSONValue {
//        get {
//            switch self {
//            case .JArray(let jsonArray) where jsonArray.count > index:
//                return jsonArray[index]
//            case .JInvalid(let error):
//                if let userInfo = error.userInfo{
//                    if let breadcrumb = userInfo["JSONErrorBreadCrumbKey"] as? NSString{
//                        let newBreadCrumb = (breadcrumb as String) + "/\(index)"
//                        let newUserInfo = [NSLocalizedDescriptionKey: "JSON Keypath Error: Incorrect Keypath \"\(newBreadCrumb)\"",
//                            "JSONErrorBreadCrumbKey": newBreadCrumb]
//                        return JSONValue.JInvalid(NSError(domain: "JSONErrorDomain", code: 1002, userInfo: newUserInfo))
//                    }
//                }
//                return self
//            default:
//                let breadcrumb = "\(index)"
//                let newUserInfo = [NSLocalizedDescriptionKey: "JSON Keypath Error: Incorrect Keypath \"\(breadcrumb)\"",
//                    "JSONErrorBreadCrumbKey": breadcrumb]
//                return JSONValue.JInvalid(NSError(domain: "JSONErrorDomain", code: 1002, userInfo: newUserInfo))
//            }
//        }
//    }
//    
//    subscript(key: String) -> JSONValue {
//        get {
//            switch self {
//            case .JObject(let jsonDictionary):
//                if let value = jsonDictionary[key] {
//                    return value
//                }else {
//                    let breadcrumb = "\(key)"
//                    let newUserInfo = [NSLocalizedDescriptionKey: "JSON Keypath Error: Incorrect Keypath \"\(breadcrumb)\"",
//                        "JSONErrorBreadCrumbKey": breadcrumb]
//                    return JSONValue.JInvalid(NSError(domain: "JSONErrorDomain", code: 1002, userInfo: newUserInfo))
//                }
//            case .JInvalid(let error):
//                if let userInfo = error.userInfo{
//                    if let breadcrumb = userInfo["JSONErrorBreadCrumbKey"] as? NSString{
//                        let newBreadCrumb = (breadcrumb as String) + "/\(key)"
//                        let newUserInfo = [NSLocalizedDescriptionKey: "JSON Keypath Error: Incorrect Keypath \"\(newBreadCrumb)\"",
//                            "JSONErrorBreadCrumbKey": newBreadCrumb]
//                        return JSONValue.JInvalid(NSError(domain: "JSONErrorDomain", code: 1002, userInfo: newUserInfo))
//                    }
//                }
//                return self
//            default:
//                let breadcrumb = "/\(key)"
//                let newUserInfo = [NSLocalizedDescriptionKey: "JSON Keypath Error: Incorrect Keypath \"\(breadcrumb)\"",
//                    "JSONErrorBreadCrumbKey": breadcrumb]
//                return JSONValue.JInvalid(NSError(domain: "JSONErrorDomain", code: 1002, userInfo: newUserInfo))
//            }
//        }
//    }
//}
//
//extension JSONValue: Printable {
//    var description: String {
//    switch self {
//    case .JInvalid(let error):
//        return error.localizedDescription
//    default:
//        return _printableString("")
//        }
//    }
//    
//    var rawJSONString: String {
//    switch self {
//    case .JNumber(let value):
//        return "\(value)"
//    case .JBool(let value):
//        return "\(value)"
//    case .JString(let value):
//        let jsonAbleString = value.stringByReplacingOccurrencesOfString("\"", withString: "\\\"", options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil)
//        return "\"\(jsonAbleString)\""
//    case .JNull:
//        return "null"
//    case .JArray(let array):
//        var arrayString = ""
//        for (index, value) in enumerate(array) {
//            if index != array.count - 1 {
//                arrayString += "\(value.rawJSONString),"
//            }else{
//                arrayString += "\(value.rawJSONString)"
//            }
//        }
//        return "[\(arrayString)]"
//    case .JObject(let object):
//        var objectString = ""
//        var (index, count) = (0, object.count)
//        for (key, value) in object {
//            if index != count - 1 {
//                objectString += "\"\(key)\":\(value.rawJSONString),"
//            } else {
//                objectString += "\"\(key)\":\(value.rawJSONString)"
//            }
//            index += 1
//        }
//        return "{\(objectString)}"
//    case .JInvalid:
//        return "INVALID_JSON_VALUE"
//        }
//    }
//    
//    func _printableString(indent: String) -> String {
//        switch self {
//        case .JObject(let object):
//            var objectString = "{\n"
//            var index = 0
//            for (key, value) in object {
//                let valueString = value._printableString(indent + "  ")
//                if index != object.count - 1 {
//                    objectString += "\(indent)  \"\(key)\":\(valueString),\n"
//                } else {
//                    objectString += "\(indent)  \"\(key)\":\(valueString)\n"
//                }
//                index += 1
//            }
//            objectString += "\(indent)}"
//            return objectString
//        case .JArray(let array):
//            var arrayString = "[\n"
//            for (index, value) in enumerate(array) {
//                let valueString = value._printableString(indent + "  ")
//                if index != array.count - 1 {
//                    arrayString += "\(indent)  \(valueString),\n"
//                }else{
//                    arrayString += "\(indent)  \(valueString)\n"
//                }
//            }
//            arrayString += "\(indent)]"
//            return arrayString
//        default:
//            return rawJSONString
//        }
//    }
//}
//
//extension JSONValue: LogicValue {
//    func getLogicValue() -> Bool {
//        switch self {
//        case .JInvalid:
//            return false
//        default:
//            return true
//        }
//    }
//}
//
//extension JSONValue : Equatable {
//    
//}
//
//func ==(lhs: JSONValue, rhs: JSONValue) -> Bool {
//    switch lhs {
//    case .JNumber(let lvalue):
//        switch rhs {
//        case .JNumber(let rvalue):
//            return rvalue == lvalue
//        default:
//            return false
//        }
//    case .JString(let lvalue):
//        switch rhs {
//        case .JString(let rvalue):
//            return rvalue == lvalue
//        default:
//            return false
//        }
//    case .JBool(let lvalue):
//        switch rhs {
//        case .JBool(let rvalue):
//            return rvalue == lvalue
//        default:
//            return false
//        }
//    case .JNull:
//        switch rhs {
//        case .JNull:
//            return true
//        default:
//            return false
//        }
//    case .JArray(let lvalue):
//        switch rhs {
//        case .JArray(let rvalue):
//            return rvalue == lvalue
//        default:
//            return false
//        }
//    case .JObject(let lvalue):
//        switch rhs {
//        case .JObject(let rvalue):
//            return rvalue == lvalue
//        default:
//            return false
//        }
//    default:
//        return false
//    }
//}
