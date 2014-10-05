// From http://sketchytech.blogspot.co.uk/2014/08/swift-generics-its-all-in-protocols.html

func fl<T:FloatingPointType>(t:T,b:T) {
    
    // FloatingPointType
    t._toBitPattern()
    t.isFinite
    t.isFinite
    t.isNaN
    t.isNormal
    t.isSignaling
    t.isSignMinus
    t.isSubnormal
    t.isZero
    
    // Strideable
    t.distanceTo(b)
    t.advancedBy(2)
    
    // Comparable
    t <= b
    t >= b
    t > b
    t < b
    
    // Equatable
    t == b
}

fl(2.0, 2.0)
fl(2, 2) //Int does not conform to FloatingPointType