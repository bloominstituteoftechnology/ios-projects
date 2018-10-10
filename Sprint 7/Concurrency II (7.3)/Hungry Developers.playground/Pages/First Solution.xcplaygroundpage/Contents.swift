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
    
    init (lhs: Spoon, rhs: Spoon) {
        self.leftSpoon = lhs
        self.rightSpoon = rhs
    }
    
    func think() {
        leftSpoon.pickUp()
        rightSpoon.pickUp()
    }
    
    func eat() {
        print("Started eating")
        usleep(UInt32.random(in: 1...1000))
        leftSpoon.putDown()
        rightSpoon.putDown()
        print("Finished eating")
    }
    
    func run() {
        for _ in 0..<10000 {
            think()
            eat()
        }
    }
}

let developer1 = Developer(lhs: Spoon(), rhs: Spoon())
let developer2 = Developer(lhs: Spoon(), rhs: developer1.leftSpoon)
let developer3 = Developer(lhs: Spoon(), rhs: developer2.leftSpoon)
let developer4 = Developer(lhs: Spoon(), rhs: developer3.leftSpoon)
let developer5 = Developer(lhs: developer1.rightSpoon, rhs: developer4.leftSpoon)

let developers = [developer1, developer2, developer3, developer4, developer5]

DispatchQueue.concurrentPerform(iterations: 5) { developers[$0].run() }
