
// overloading

var sum = [1, 2] + [3, 4]


// semantics issue: + undestood either by append or sum of elt
// why no - ?


//func -(left: [Int], right: [Int]) -> [Int] {
//    var minus = [Int]()
//    minus = left.filter {!contains(right, $0)}
//    return minus
//}
//
//var minusArray = [1, 2, 3] - [1, 2,3]
//minusArray = [1, 2, 3] - [1]

// suppose working with vectors
func +(left: [Int], right: [Int]) -> [Int] {
    var sum = [Int](count: left.count, repeatedValue: 0)
    assert(left.count == right.count, "operation of vector of same dimeention only")
    for (i, _) in enumerate(left) {
        sum[i] = left[i] + right[i]
    }
    return sum
}
var sumArray1 = [1, 2, 3] + [1, 2, 3]

func -(left: [Int], right: [Int]) -> [Int] {
    var minus = [Int](count: left.count, repeatedValue: 0)
    assert(left.count == right.count, "operation of vector of same dimeention only")
    for (i, _) in enumerate(left) {
        minus[i] = left[i] - right[i]
    }
    return minus
}
var minusArray2 = [1, 2, 3] - [1, 2, 3]
minusArray2 = [1, 2, 3] - [0, -2, 4]

// to resolve this semantics issue, let's go custom operator

// “ If you really want to, you can create an operator called <~^~> and make it do what you want. It will be interesting to see what people do with this, and we’ll all have to be really careful not to let this power go to our heads.”
//— Mike Ash, Interesting Swing Feature

// as my friend Andres Almary says (about Scala): no ascii art, just code that read well => apply to swift too
// http://www.cakesolutions.net/teamblogs/2012/02/06/scala-is-not-ascii-art

// Mathematics symbols allowed


// go crazy
// Great power came great responsabilities
// Golden rules descibed by Mattt

//var root: String
//root = ""
//root += "toto"
////root += 2 // error: 'String' is not identical to 'UInt8'
//
//infix operator  <<< { associativity left precedence 150 }
//
//func <<<<T> (inout left: [T], right: [T]) -> [T] {
//    left.extend(right)
//    return left
//}
////func <<<<B?> (l: String?, r: B?) -> String {
////    if let l1 = l {
////        if let r1 = r {
////            return l1(r1)
////        }
////    }
////    return nil
////}
//
//
//func <<<T> (inout left: [T], right: [T]) -> [T] {
//    left.extend(right)
//    return left
//}
//
//func <<<T> (inout left: [T], right: T) -> [T] {
//    left.append(right)
//    return left
//}