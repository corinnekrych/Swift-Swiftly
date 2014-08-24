
// overloading

var sum = [1, 2] + [3, 4]
var minus = [1,2,3] - [1, 3]

// semantics issue: + undestood either by append or sum of elt
// why no - ?

var root: String
root = ""
root += "toto"
//root += 2 // error: 'String' is not identical to 'UInt8'

infix operator  <<< { associativity left precedence 150 }

func <<<<T> (inout left: [T], right: [T]) -> [T] {
    left.extend(right)
    return left
}
//func <<<<B?> (l: String?, r: B?) -> String {
//    if let l1 = l {
//        if let r1 = r {
//            return l1(r1)
//        }
//    }
//    return nil
//}


func <<<T> (inout left: [T], right: [T]) -> [T] {
    left.extend(right)
    return left
}

func <<<T> (inout left: [T], right: T) -> [T] {
    left.append(right)
    return left
}