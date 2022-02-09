# Closure
They are anonymous functions, functions without a name.

They are commonly used in Swift when a function takes in another function as an input

```swift
// general function definition
func  functionName (firstVariable: variableType) -> returnType {
    // functionality
    return returnValue
}
```

Closure Syntax
```swift
{
    (paramters) -> return type in
    statements
}
```

# Closure Examples
## Calculator Example

```swift
// note how we define the type operation function as an input
func calculator (n1: Int, n2: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(n1, n2)
}

// lets try to define a add funtion and a multiply function
func add (n1: Int, n2: Int) -> Int {
    return n1 + n2
}

func multiply (n1: Int, n2: Int) -> Int {
    return n1 * n2
}

print(calculator(n1:1, n2:2, operation: add))
print(calculator(n1:1, n2:2, operation: multiply))
```
This is one way to create a simple calculator, however, it is very wordy. 

One way to make it more readible and less wordy is to use closures

Steps to change a typical swift function to a closure:
1. remove `func` and the function name
1. move the open `{` to the front and replace it with `in`
1. remove the Type in the variables as swift can do type inference
1. you can also remove the output e.g. `-> dataType`
```swift
// We can rewrite the add function
func add (n1: Int, n2: Int) -> Int {
    return n1 + n2
}
// to
{ (n1, n2) in return n1+n2 }
```

Our new calculator code be just simplifed to just
```swift
func calculator (n1: Int, n2: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(n1, n2)
}

print(calculator(n1:1, n2:2, operation: { (n1,n2) in return n1+n2}))
print(calculator(n1:1, n2:2, operation: { (n1,n2) in return n1*n2}))

// You can use anonymous variable names as well to make it even shorter!
print(calculator(n1:1, n2:2, operation: {$0 + $1}))
print(calculator(n1:1, n2:2, operation: {$0 * $1}))

// We can make it even shorter, in swift if your last variable in your function is a closure, you can actually omit the kwarg and have it trailing at the end of the function
print(calculator(n1:1, n2:2) {$0 + $1})
print(calculator(n1:1, n2:2) {$0 * $1})
```

## Array and maps
Closures are very commonly used in practice with the map function and arrays.
```swift
let array = [6,2,3,9,4,1]

// add one to all values in array

let newArray  = array.map{$0 + 1}

// stringify all the values in an array

let stringArray = array.map{"\($0)"}

```



# Closing remarks
Closures can dramatically reduce the length of the code and have more stylebut readibility suffers, especially for new comers learning swift
