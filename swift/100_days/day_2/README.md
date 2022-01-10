# Day 2
## Arrays
Arrays are collections of values that are stored as a single values.

```swift
let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrsion"
let ringo = "Ringo Starr"

let bealtes = [john, paul, george, ringo]
```

The last line makes the array. 

You can read values from an array by writing a number inside the brackets. Array positions count from 0

```swift
beatles[1] 
```
returns `"Paul McCartney"`

## Sets
Sets are collections like array except the following two differences:
1. items are un ordered. They are stored in what is effectively a random order
2. all items are unique

```swift
let colors = Set(["red", "green", "blue"])
```

## Tuples
Tuples allow you to store several values together in a single value. This might sound like arrays but they have the following differences:
1. You can't add or remove or change the types of items from a tuple. They are fixed in size. but you can change the value of the tuple
2. You can access items in a tuple using numerical positions or by naming them

```swift
var name = (first: "Taylor", last:"Swift")
```

You then can access items using numiercal positions starting from 0.
```swift
name.0
```
or buy using their names
```swift
name.first
```

## Dictionaries
Dictionaries are colections of values just like arrays, but rather than storing things with an integer position, you can access them using anything you want.

These identifies are called `keys`, and you can use them to read data back out of the dictionary

```swift
let heights = [
    "Taylor Swift": 1.78,
    "Ed Sheeren": 1.73
]

heights["Taylor Swift"]
```

If you try to read a value from a dictionary using a key that doesn't exist, `Swift` would return `nil`. 

We can fix this by giving the dictionary a defualt value of `"Unkown"`
```swift
let favouriteIceCream = [
    "Paul": "Chocolate",
    "Sophie": "Vanilla"
]

favouriteIceCream["Charlotte"] # returns nil

favouriteIceCream["Charlotte", default:"Unknown"] # returns "Unkown"
```

## Creating empty collections
Arrays, sets, and dictionaries are called collections, because they collect values together in one place.

If you want to create an empty collection, just write its type following by a bracket. For example, we can create an empty dictionary with strings for keys and values like this:
```swift
var teams = [String: String]()
```
We can then add entries later on, like this
```swift
teams["Paul"] = "Red"
```

Similarly, you can create an empty array to store integers like this:
```swift
var results = [Int]()
```
`Swift` has special syntax only for dictionaries and arrays; other types must use angle bracket syntax as shown
```swift
var words = Set<String>()
var scores = Dictionary<String, Int>()
var results = Array<Int>()
```

## Enumerations
usually called `enums` are a way of defining groups of related values in a way that makes them easier to use.

For example, change this
```swift
let result = "failure"
let result2 = "failure"
let result3 = "failure"
```

to this
```swift
enum Result {
    case success
    case failure
}
```

And now when we use it we must choose one of those two values. This stops you from accidentally using different strings each time
```swift
let result4 = Result.failure
```

### Enum associated values
As well as storing simple value, enums can also store associated values attached to each case. This lets you attach additional information to your enums so they can represent more nuanced data

For example, simple value `enum` would be like
```swift
enum Activity {
    case bored
    case running
    case talking
    case singing
}
```
Associated values let use add additional details:
```swift
enum Activity{
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}
```
Now we can be more precise -- we can say that someone is talking about football
```swift
let talking = Activity.talking(topic: "football")
```
### Enum raw values
Sometimes you need to be able to assign values to enums so they have meaning. This lets you create them dynamically.

Example
```swift
enum Planet: Int {
    case mercury
    case venus
    case earth
    case mars
}
```
`Swift` will automatically assign each of those a number starting from `0` and you can use that number to create an instance of the appropriate enum case. For our example, `earth` is given the number 2, so you can write this
```swift
let earth = Planet(rawValue: 2)
```

You can also assign one or more caes a specific value, and Swift will generate the rest. 
```swift
enum Planet: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}
```