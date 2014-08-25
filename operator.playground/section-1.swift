
// overloading

var sum = [1, 2] - [3, 4]


// semantics issue: + undestood either by append or sum of elt
// why no - ?


//func -(left: [Int], right: [Int]) -> [Int] {
//    var minus = [Int]()
//    minus = left.filter {!contains(right, $0)}
//    return minus
//}

//var minusArray = [1, 2, 3] - [1, 2,3]
//minusArray = [1, 2, 3] - [1]

// suppose working with vectors
func +(left: [Int], right: [Int]) -> [Int] {
    var sum = [Int](count: left.count, repeatedValue: 0)
    assert(left.count == right.count, "vector of same length only")
    for (key, v) in enumerate(left) {
      sum[key] = left[key] + right[key]
    }
    return sum
}
var sumArray1 = [1, 2, 3] + [1, 2, 3]

func -(left: [Int], right: [Int]) -> [Int] {
    var minus = [Int](count: left.count, repeatedValue: 0)
    assert(left.count == right.count, "vector of same length only")
    for (key, v) in enumerate(left) {
        minus[key] = left[key] - right[key]
    }
    return minus
}
var minusArray2 = [1, 2, 3] - [1, 2, 3]
minusArray2 = [1, 2, 3] - [0, -2, 4]

// to resolve this semantics issue, let's go custom operator ⊕ and ⊖

infix operator  ⊕ { associativity left precedence 140 }
func ⊕(left: [Int], right: [Int]) -> [Int] {
    var sum = [Int](count: left.count, repeatedValue: 0)
    assert(left.count == right.count, "vector of same length only")
    for (key, v) in enumerate(left) {
        sum[key] = left[key] + right[key]
    }
    return sum
}

infix operator  ⊖ { associativity left precedence 140 }
func ⊖(left: [Int], right: [Int]) -> [Int] {
    var minus = [Int](count: left.count, repeatedValue: 0)
    assert(left.count == right.count, "vector of same length only")
    for (key, v) in enumerate(left) {
        minus[key] = left[key] - right[key]
    }
    return minus
}
var sumArray3 = [1, 2, 3] ⊕ [1, 2, 3]
var minusArray3 = [1, 2, 3] ⊖ [1, 2, 3]
minusArray3 = [1, 2, 3] ⊖ [0, -2, 4]

infix operator  ⊖= { associativity left precedence 140 }
func ⊖=(inout left: [Int], right: [Int]) {
    left = left ⊖ right
}
infix operator  ⊕= { associativity left precedence 140 }
func ⊕=(inout left: [Int], right: [Int]) {
    left = left ⊕ right
}
sumArray3 ⊕= [1, 1, 1]


