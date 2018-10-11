import UIKit

class Spoon {
    
    private let lock = NSLock()
    
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
    
    init (lhs: Spoon, rhs: Spoon, name: String) {
        self.leftSpoon = lhs
        self.rightSpoon = rhs
        self.name = name
    }
    
    func think() {
        leftSpoon.pickUp()
        rightSpoon.pickUp()
    }
    
    func eat() {
        print("\(name) Started eating")
        usleep(UInt32.random(in: 1...1000))
        leftSpoon.putDown()
        rightSpoon.putDown()
        print("\(name) Finished eating")
    }
    
    func run() {
        for _ in 0..<runTimes {
            think()
            eat()
        }
    }
}

let developer1 = Developer(lhs: Spoon(), rhs: Spoon(), name: "Dev1")
let developer2 = Developer(lhs: Spoon(), rhs: developer1.leftSpoon, name: "Dev2")
let developer3 = Developer(lhs: Spoon(), rhs: developer2.leftSpoon, name: "Dev3")
let developer4 = Developer(lhs: Spoon(), rhs: developer3.leftSpoon, name: "Dev4")
let developer5 = Developer(lhs: developer1.rightSpoon, rhs: developer4.leftSpoon, name: "Dev5")

let developers = [developer1, developer2, developer3, developer4, developer5]

let runTimes = 10
DispatchQueue.concurrentPerform(iterations: 5) { developers[$0].run() }
