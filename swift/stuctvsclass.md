# Structs vs Classes
|       | Structs                      | Classes        | Description                                           |
|---        |---                        |---            |---                                                    |
| Inheritance         | Cannot                   | Can    | Classes can have inheritance                                            |
|Initializer | Free Initilializer | Need to provide the init method | Struct don't need to write the init method
|Creation |Structs are passed by value (a copy is made) |Classes are passed by Reference |Classes are more complex and more error prone as there is a danger to reference multiple objects.
|Mutation | By default Struct is immutable. You would need to have a mutating before the struct method | Class is mutable | When you want to change the property of a struct, it will destroy the current one to build a new one
|Passing in arguments | | |

# General advise
- Use Structures by default when design blueprint for app
- Use structures along with protocols to adopt behavior by sharing implementations
- Use classes when you need Objective-C interoperability
- Use classes when you need to control the identity of the data you're modeling
