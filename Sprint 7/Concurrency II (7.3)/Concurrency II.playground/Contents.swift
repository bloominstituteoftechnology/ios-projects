import Foundation

let lock = NSLock()

class Spoon {
    
    func pickUp(spoon: Spoon) {
        lock.lock()
    }
    
    func putDown(spoon: Spoon) {
        lock.unlock()
    }
}



class Developer {
    
    var leftSpoon: Spoon

    var rightSpoon: Spoon
    
    init(leftSpoon: Spoon, rightSpoon: Spoon) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
    func think() {
        
        print("Thinking")
        
        Spoon.pickUp(leftSpoon)
        
        print("Picked up left spoon")
        
        Spoon.pickUp(rightSpoon)
        
        print("Picked up right spoon")
        
    }
    
    func eat() {
        
        print("Eating")
        
        usleep(500_000)
        
        Spoon.putDown(leftSpoon)
        
        print("Put down left spoon")
        
        Spoon.putDown(rightSpoon)
        
        print("Put down right spoon")
        
    }
    
    func run() {
        
        var shouldRun = true
        
        // add loop here to make these functions run continually
        while shouldRun == true {
            think()
            eat()
        }
    }
}

var spoons: [Spoon] = []

var developers: [Developer] = []

// Create 5 spoons
let spoon1 = Spoon()
let spoon2 = Spoon()
let spoon3 = Spoon()
let spoon4 = Spoon()
let spoon5 = Spoon()

// Create 5 developers with spoons
let developer1 = Developer(leftSpoon: spoon1, rightSpoon: spoon2)
let developer2 = Developer(leftSpoon: spoon2, rightSpoon: spoon3)
let developer3 = Developer(leftSpoon: spoon3, rightSpoon: spoon4)
let developer4 = Developer(leftSpoon: spoon4, rightSpoon: spoon5)
let developer5 = Developer(leftSpoon: spoon5, rightSpoon: spoon1)

// Add developers to an array
developers.append(developer1)
developers.append(developer2)
developers.append(developer3)
developers.append(developer4)
developers.append(developer5)

DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}




