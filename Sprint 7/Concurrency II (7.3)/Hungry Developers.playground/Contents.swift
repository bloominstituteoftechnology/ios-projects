import UIKit

class Spoon {
    
    let lock = NSLock()
    
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
        leftSpoon.pickUp()
        rightSpoon.pickUp()
        
        return
    }
    
    func eat() {
        print("\(name) is currently eating")
        sleep(2)
        
        leftSpoon.putDown()
        rightSpoon.putDown()
        print("\(name) is DONE eating")
    }
    
    func run() {
        think()
        eat()
    }
}

let Spoon1 = Spoon()
let Spoon2 = Spoon()
let Spoon3 = Spoon()
let Spoon4 = Spoon()
let Spoon5 = Spoon()

let Developer1 = Developer(leftSpoon: Spoon1, rightSpoon: Spoon2, name: "#1")
let Developer2 = Developer(leftSpoon: Spoon2, rightSpoon: Spoon3, name: "#2")
let Developer3 = Developer(leftSpoon: Spoon3, rightSpoon: Spoon4, name: "#3")
let Developer4 = Developer(leftSpoon: Spoon4, rightSpoon: Spoon5, name: "#4")
let Developer5 = Developer(leftSpoon: Spoon5, rightSpoon: Spoon1, name: "#5")

let developers = [Developer1, Developer2, Developer3, Developer4, Developer5]

DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}

