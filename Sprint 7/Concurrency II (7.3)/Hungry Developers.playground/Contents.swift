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
    
    func eat() {
        usleep(100)
        rightSpoon.putDown()
        leftSpoon.putDown()
    }
    
    func think() {
        leftSpoon.pickUp()
        rightSpoon.pickUp()
    }
    
    func run() {
        while true {
            think()
            eat()
        }
    }
    var rightSpoon = Spoon()
    var leftSpoon = Spoon()
}

let spoon1 = Spoon()
let spoon2 = Spoon()
let spoon3 = Spoon()
let spoon4 = Spoon()
let spoon5 = Spoon()

let developer1 = Developer()
let developer2 = Developer()
let developer3 = Developer()
let developer4 = Developer()
let developer5 = Developer()

developer1.leftSpoon = spoon1
developer1.rightSpoon = spoon2
developer2.leftSpoon = spoon2
developer2.rightSpoon = spoon3
developer3.leftSpoon = spoon3
developer3.rightSpoon = spoon4
developer4.leftSpoon = spoon4
developer4.rightSpoon = spoon5
developer5.leftSpoon = spoon5
developer5.rightSpoon = spoon1

let spoons: [Spoon] = [spoon1, spoon2, spoon3, spoon4, spoon5]
let developers: [Developer] = [developer1, developer2, developer3, developer4, developer5]

DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}


