# Day 1
## Variables

## Strings and integers
You can specify large number using underscore
```swift
var x = 8_000_000
```
## Multi-line strings

You can write multi line string using triple double quotes

```swift
var multi_line = """ This is a \
multi-line \
string"""
```
You can use the backslash to escape the line breaks
## Doubles and Booleans

## String Interpolations
The ability to add varibles in your string

```swift
var score = 85
var str = "Your score was \(score)"
```

## Constants
`var` can change the values.

`let` is to set something as a constant. 

`swift` would not allow you to chage the values of a constant

```swift
let name = "Ren Jie"
```
## Type annotations
`swift` assigns each variable and constant a typed based on what value it's given when its create. This is called type inference.

You can be explicit about the type of your data rather than relying on `swift`'s type inference.

```swift
let album: String = "I rock!"
let year: Int = 2020
let height: Double = 1.72
let RJRocks: Bool = true
```