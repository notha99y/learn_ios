# Type Casting
When you are coding Swift, or looking at other people's code, you might come across the following keywords: `as`, `as?`, `as!` and `is`.

## Is
`is` is used for type checking.

```swift
let testNumber = 1.0

if testNumber is Double {
    print("\(testNumber) is a Double")
}
```

## Type downcasting
`as!` is known as a force downcast, where we cast down the superclass to its subclass 

`as?` is a safer way to do the down casting. 

`as` use to upcast back to superclass. You dont need a ! or ? because when you upclass back to the superclass, it will always work.
```swift
class Animal {
    var name: String

    init(n: String){
        name = n
    }
}

class Human: Animal {
    func write() {
        print("Type away")
    }
}

class Fish: Animal {
    func breathUnderWater() {
        print("Bloop Bloop")
    }
}

let renjie = Human(n: "Ren Jie")
let fredrick = Human(n: "Fredrick")
let nemo = Fish(n: "Nemo")


let animals: [Animal] = [
    renjie, fredrick, nemo
]

for animal in animals {
    if animal is Fish {
        let fish = animal as! Fish // need to downcast to use the breathUnderWater() method
        fish.breathUnderWater()
    }
}
```

## Swif Classes
- `Any`: All objects
- `AnyObject`: Objects derived from classes (e.g. structs are not in this subset)
- `NSObject`: Objects created from `Foundation` module
