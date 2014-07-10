## Tuple
Tuples are groups of values combined into a single, compound value. Very often use as return type of a function. For example, it allows you to return a value combined with an error code.

### Defining a Tuple
Use parenthesis around the comma-delimited list of values

* without specifying types, so it relies on inference

```swift
let httpError404 = (404, "Not found")
```

* with type

```swift
let someOtherTuple = (Double(100), Bool(false))
let someOtherTuple2:(Double, Bool) = (100, false)
```

### Accessing a Tuple

* Decomposing tuples looks like this

```swift
var (varStatusCode, varStatusMessage) = httpError404
varStatusCode
varStatusMessage
```

* Access tuple values with the dot operator followed by their index:
```swift
httpError404.0
httpError404.1
```

* Alternatively, you can name the elements of a Tuple
```swift
let namedTuple = (statusCode: 404, message: "Not found")
```

* When you name the elements you effectively assign names to their indices, so the dot operator works with names or integers:
```swift
namedTuple.statusCode == namedTuple.0
namedTuple.message == namedTuple.1
```

### Tuple and Array
With Beta3, syntax 