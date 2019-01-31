import Foundation

class Spoon {
    
    let lock = NSLock()
    
    let index: Int
    
    init(index: Int) {
        self.index = index
    }
    
    func pickUp() {
        lock.lock()
    }
    
    func putDown() {
        lock.unlock()
    }
}



class Developer {
    
    var leftSpoon: Spoon

    var rightSpoon: Spoon
    
    var name: String
    
    init(leftSpoon: Spoon, rightSpoon: Spoon, name: String) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
        self.name = name
    }
    
    func think() {
        
        print("\(name) is thinking")
        
        if leftSpoon.index > rightSpoon.index {
            
            // Pick up larger index spoon
            leftSpoon.pickUp()
            print("\(name) picked up left spoon")
            
            // then pick up other spoon
            rightSpoon.pickUp()
            print("\(name) picked up right spoon")
        } else {
            
            // Pick up larger index spoon
            rightSpoon.pickUp()
            print("\(name) picked up right spoon")
            
            // then pick up other spoon
            leftSpoon.pickUp()
            print("\(name) picked up left spoon")
        }
    }
    
    func eat() {
        
        print("\(name) is eating")
        
        // 10th of a second and 1 second
        usleep(UInt32.random(in: 100_000 ... 1_000_000))
        
        leftSpoon.putDown()
        print("\(name) put down left spoon")
        
        rightSpoon.putDown()
        print("\(name) put down right spoon")
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
let spoon1 = Spoon(index: 1)
let spoon2 = Spoon(index: 2)
let spoon3 = Spoon(index: 3)
let spoon4 = Spoon(index: 4)
let spoon5 = Spoon(index: 5)

// Create 5 developers with spoons
let developer1 = Developer(leftSpoon: spoon1, rightSpoon: spoon2, name: "Developer 1")
let developer2 = Developer(leftSpoon: spoon2, rightSpoon: spoon3, name: "Developer 2")
let developer3 = Developer(leftSpoon: spoon3, rightSpoon: spoon4, name: "Developer 3")
let developer4 = Developer(leftSpoon: spoon4, rightSpoon: spoon5, name: "Developer 4")
let developer5 = Developer(leftSpoon: spoon5, rightSpoon: spoon1, name: "Developer 5")

// Add developers to an array
developers.append(developer1)
developers.append(developer2)
developers.append(developer3)
developers.append(developer4)
developers.append(developer5)

DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}




