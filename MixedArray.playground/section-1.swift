// From http://sketchytech.blogspot.co.uk/2014/08/swift-anyobject-is-not-your-only-option.html?utm_content=buffer70d26&utm_medium=social&utm_source=twitter.com&utm_campaign=buffer

protocol Mixed {
}

extension String:Mixed {
}

extension Array:Mixed {
}

extension Dictionary:Mixed {
}

var a:[Mixed] = ["String",[1,2,3],["one":1,"two":2]]

//a.append(1) // error