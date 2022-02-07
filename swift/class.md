# Classes
Like Struct, Class is a way to define a blueprint

## Syntax
The same as struct

### Defining the class
```swift
class Enemy {
    var health = 100
    var attackStrength = 10

    func move(){
        // do something
        print("Walk forward")
    }

    func attack(){
        // do something
        print("Attack, does \(attackStrength) damnage")
    }

}
```

### Initialize the class
```swift
let skeleton = Enemy()
```

## Inheritance
Class has an additinal ability compared to struct and that is that they can inherit from a SuperClass

SuperClass is like a parent and the SubClass is the child where it can inherit the parent's properties and methods and add on to their own properties and methods.

SubClass is also able to override the properties and methods of the SuperClass

### Inheritance Example
```swift
class Dragon: Enemy {
    var wingSpan = 2

    func talk(speech: String){
        print("Says: \(speech)")
    }

    override func move(){
        print("Fly foward")
    }

    override func attack(){
        super.attack() // using the super class attack method
        print("Spits fire, does 10 damange")
    }
}
```