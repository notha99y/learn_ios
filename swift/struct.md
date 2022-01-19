# Structs
Structs help us create custom data types. Some default structs in Swift are like `Int`, `Float`, `String`, `Bool`

## Defining
```swift
struct StructureName {
    // Define properties
    let ...

    // init method
    init(properties...)

    // other methods
    func ...
}
```

```swift
struct User {
  let name: String
  let email: String?
  var numFollowers: Int
  var isActive: Bool

  init(name: String, email: String?=nil, numFollowers: Int, isActive: Bool){
    self.name = name
    self.email = email
    self.numFollowers = numFollowers
    self.isActive = isActive
  } 
  func logStatus() {
    if self.isActive {
      print("\(self.name) is working hard")
      } else {
        print("\(self.name) has left earth")
      }
  }
}

print("\nDiagnostic code (i.e., Challenge Hint):")
var richard = User(name: "Richard", numFollowers: 0, isActive: false)
richard.logStatus()

var musk = User(name: "Elon", email: "elon@tesla.com", numFollowers: 2001, isActive: true)
musk.logStatus()
print("Contacting \(musk.name) on \(musk.email!) ...")
print("\(musk.name) has \(musk.numFollowers) followers")
// sometime later
musk.isActive = false
musk.logStatus()
```

## Mutating struct methods
By default, properties defined in structs are immutable. e.g. `self is unmutable`

If you have a method that wishs to change the property of a struct, you would need to add a `mutating` keyword in front of the function 

```swift
struct Town {
    let name: String
    var citizens: [String]
    var resources: [String: Int]

    init(citizens: [String], name: String, resources: [String:Int]){
        self.citizens = citizens
        self.name = name.uppercased()
        self.resources = resources
    }

    mutating func harvestRice(){
        resources["Rice"] = 100
    }
}
```