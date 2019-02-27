import UIKit

class Spoon {
    private let lock = NSLock()
    
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
    var devNumber: String
    
    init(leftSpoon: Spoon, rightSpoon: Spoon, devNumber: String) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
        self.devNumber = devNumber
    }
    
    func think() {
        
        //make sure devs pick spoon on the left first
        if leftSpoon.index < rightSpoon.index {
            print("\(devNumber) is thinking.")
            
            leftSpoon.pickUp()
            print("\(devNumber) picked up left spoon.")
            
            rightSpoon.pickUp()
            print("\(devNumber) picked up right spoon.")
        } else {
            rightSpoon.pickUp()
            print("\(devNumber) picked up right spoon.")
            
            leftSpoon.pickUp()
            print("\(devNumber) picked up left spoon.")
        }
    }
    
    func eat() {
        //shoud pause for random amount of time before putting both spoons down usleep()
        usleep(1000)
        print("\(devNumber) is eating")
    }
    
    func run() {
        //Developer.run() should call think() then eat() over and over again forever.
        while true {
            think()
            eat()
        }
    }
}

let Spoon1 = Spoon(index: 1)
let Spoon2 = Spoon(index: 2)
let Spoon3 = Spoon(index: 3)
let Spoon4 = Spoon(index: 4)
let Spoon5 = Spoon(index: 5)

let Developer1 = Developer(leftSpoon: Spoon1, rightSpoon: Spoon2, devNumber: "Developer 1 ")
let Developer2 = Developer(leftSpoon: Spoon2, rightSpoon: Spoon3, devNumber: "Developer 2 ")
let Developer3 = Developer(leftSpoon: Spoon3, rightSpoon: Spoon4, devNumber: "Developer 3 ")
let Developer4 = Developer(leftSpoon: Spoon4, rightSpoon: Spoon5, devNumber: "Developer 4 ")
let Developer5 = Developer(leftSpoon: Spoon5, rightSpoon: Spoon1, devNumber: "Developer 5 ")

let developers = [Developer1, Developer2, Developer3, Developer4, Developer5]

DispatchQueue.concurrentPerform(iterations: 29) {
    developers[$0].run()
}


