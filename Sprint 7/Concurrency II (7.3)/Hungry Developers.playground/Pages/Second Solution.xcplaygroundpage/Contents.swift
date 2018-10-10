//: [Previous](@previous)

import Foundation

class Spoon {
    
    private let lock = NSLock()
    let index: Int
    
    init(_ index: Int) {
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
    
    init (lhs: Spoon, rhs: Spoon, name: String) {
        self.leftSpoon = lhs
        self.rightSpoon = rhs
        self.name = name
    }
    
    func think() {
        if leftSpoon.index < rightSpoon.index {
            leftSpoon.pickUp()
            rightSpoon.pickUp()
        } else {
            rightSpoon.pickUp()
            leftSpoon.pickUp()
        }
    }
    
    func eat() {
        print("\(name) is eating.")
        usleep(UInt32.random(in: 1...1000))
        leftSpoon.putDown()
        rightSpoon.putDown()
    }
    
    func run() {
        for _ in 0..<10000 {
            think()
            eat()
        }
    }
}

let developer1 = Developer(lhs: Spoon(1), rhs: Spoon(2), name: "Dev1")
let developer2 = Developer(lhs: Spoon(3), rhs: developer1.leftSpoon, name: "Dev2")
let developer3 = Developer(lhs: Spoon(4), rhs: developer2.leftSpoon, name: "Dev3")
let developer4 = Developer(lhs: Spoon(5), rhs: developer3.leftSpoon, name: "Dev4")
let developer5 = Developer(lhs: developer1.rightSpoon, rhs: developer4.leftSpoon, name: "Dev5")

let developers = [developer1, developer2, developer3, developer4, developer5]

DispatchQueue.concurrentPerform(iterations: 5) { developers[$0].run() }

//: [Next](@next)
