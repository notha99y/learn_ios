# Functions in Swift

## Defining
```swift
func functionName (externalVariableName internalVeriableName: typeOfVariable) -> typeOfOutput {
    // do something
    return output
}
```

Example

```swift
func getMilk (money money: Int) -> Int {
    let costOfMilk = 2
    let change = money - costOfMilk
    return change
}
```

```swift
func isOdd(n: Int) -> Bool {
    if n % 2 == 0 {
        return true
    } else {
        return false
    }
}
```