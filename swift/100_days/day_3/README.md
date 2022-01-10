# Day 3
## Arithmetic operators
```swift
let firstScore = 12
let secondScore = 4

let total = firstScore + secondScore
let difference = firstScore - secondScore

let product = firstScore * secondScore
let divided = firstScore / secondScore

# remainder
let remainder = 13 % secondScore
```

## Operator overloading
`Swift` supports operator overloading, which is a fancy way of saying that what an operator does depends on the values you use it with. 

`Int` example
```swift
let meaningOfLife = 42
let doubleMeaning = 42 + 42
```

`String` example
```swift
let fakers = "Fakers gonna "
let action = fakers + "fake"
```

`Array` example
```swift
let firstHalf = ["John", "Paul"]
let secondHalf = ["George", "Ringo"]
let bealtes = firstHalf + secondHalf
```

## Compond assignment operators
`Swift` has shorthand operators that combine one operator with an assignment, so you can change a variable in place.
```swift
var score = 95
score -= 5 # 90

var quote = "The rain in Spain falls mainly on the "
quote += "Spaniards"
```

## Comparsion opertors
```swift
let firstScore = 6
let secondScore = 4

firstScore == secondScore
firstScore != secondScore

firstScore < secondScore
firstScore >= secondScore


"Taylor" <= "Swift"
```

## Conditions
```swift
let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 21 {
    print("Blackjack!")
} else{
    print("Regular cards")
}
```

Another example
```swift
if firstCard + seondCare == 2 {
    print("Aces - Lucky!")
} else if firstCard + secondCard == 21 {
    print("BlackJack!")
} else {
    print("Regular cards")
}

```

### Combining conditions
```swift
let age1 = 12
let age2 = 21

if age1 > 18 && age2 > 18 {
    print("Both are over 18")
}

if age1 > 18 || age2 > 18 {
    print("At least one are over 18")
}
```

### Ternary opertaor
`Swift` has a rarely used operator called the `ternary` operator. It works with three values at once. It checks a condition specified in the first value and if its true returns the second value but if its false, returns the third value/

```swift
let firstCard = 11
let secondCard = 22

print(
    firstCard == secondCard ? "Cards are the same" : "Cards are different"
)
```

We could write the same code using the regular condition:
```swift
if firstCard == secondCard {
    print("Cards are the same")
} else {
    print("Cards are different")
}
```

### Switch statements
If you have several conditions using `if` and `else if`, it's often clearer to use a different construct known as `switch case`.

Example
```swift
let weather = "sunny"

switch weather {
    case "rain":
        print("Bring an umbrella")
    case "snow":
        print("Warm up warm")
    case "sunny":
        print("Wear sunscreen")
        fallthrough # if you want execution to continue
    default:
        print("Enjoy your day")
}
```

The last case - `default` - is required because Swift makes sure you cover all possible cases so that no eventuality is missed off. 

Swift only run the code inside each case, if you want execution to continue on to the next case, use the `fallthrough` keyword as shown above.

## Range operators
Swift gives us two ways of making range: `..<` and `...` operators. The half-open range operator creates the ranges up to but excluding the final value. The closed range operator, create ranges up to and including the final value.

Ranges are helpful with `switch` blocks, because you can use them for each of your case.

```swift
let score = 85

switch score {
    case 0..<50:
        print("You failed badly")
    case 50..<85:
        print("You did ok")
    default
        print("You did great!")
}
```
