import UIKit

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
    
    let leftSpoon: Spoon
    let rightSpoon: Spoon
    let name: String
    
    init(leftSpoon: Spoon, rightSpoon: Spoon, name: String) {
        (self.leftSpoon, self.rightSpoon, self.name) = (leftSpoon, rightSpoon, name)
    }
    
    func think() {
        
        if leftSpoon.index < rightSpoon.index {
            leftSpoon.pickUp()
            rightSpoon.pickUp()
        } else {
            rightSpoon.pickUp()
            leftSpoon.pickUp()
        }
        return
    }
    
    func eat() {
        print("\(name) is currently eating")
        sleep(UInt32(Int.random(in: 0...2)))
        
        leftSpoon.putDown()
        rightSpoon.putDown()
        print("\(name) is DONE eating")
    }
    
    func run() {
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

let Developer1 = Developer(leftSpoon: Spoon1, rightSpoon: Spoon2, name: "#1")
let Developer2 = Developer(leftSpoon: Spoon2, rightSpoon: Spoon3, name: "#2")
let Developer3 = Developer(leftSpoon: Spoon3, rightSpoon: Spoon4, name: "#3")
let Developer4 = Developer(leftSpoon: Spoon4, rightSpoon: Spoon5, name: "#4")
let Developer5 = Developer(leftSpoon: Spoon5, rightSpoon: Spoon1, name: "#5")

let developers = [Developer1, Developer2, Developer3, Developer4, Developer5]

DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}

