class Bird {
    var isFemale = true
    
    func layEgg(){
        if isFemale {
            print("The bird makes a new bird in a shell")
        }
    }
}

class Eagle: Bird, CanFly {
    func fly() {
        print("The ealge flaps his wings ad")
    }
    
    func soar() {
        print("The eagle glides in the air using air currents.")
    }
}

class Penguin: Bird {
    func swim() {
        print("The penguin paddles through the water")
    }
}

protocol CanFly {
    func fly()
    
}
