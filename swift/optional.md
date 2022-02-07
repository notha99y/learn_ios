# Optionals
A type in swift that represents either a wrapped value or nil

## What are they?
You use the `Optional` type whenever you use optional values, even if you never type the word Optional. Swift's type system usually shows the wrapper type's name with a trailing question mark `?`

For example, if a variable has a type `Int?`, that's just another way of writing `Optional <Int>`
## Force Unwrapping
```swift
optional!
```
Simplest way to unwrap and optional. Only use this when you are 100% sure that the value is never `nil`
## Check for nil value
```swift
if optional != nil {
    optional!
} else{
    print("optional was found to be nil")
}
```
This is a slightly safe way to unwrap the value.

However this quite verbose and common such that there is a more elegant way to do this, called `optional binding`
## Optional Binding
```swift
if let safeOptional = optional {
    safeOptional else {
        print("optional was found to be nil")
    }
}
```
## Nil Coalescing Operator
But what is we want to provide a default value if the optional value is nil? Then use the nil coalescing operation `??`
```swift
let optional ?? defaultValue

// Example
let myOptional: String? // initialize optional String datatype
myOptional = nil // giving it a nil value
let text: String = myOptional ?? "I am the default value" // using the nil coalescing operator to assign it a default value when found to be nil
print(text)
```

## Optional Chaining
Use then when you are unwrapping an `Optional Struct`
```swift
optional?.property // if optional is not nil, then it will execute the property
optional?.method() // if optional is not nil, then it will execute the method
```
