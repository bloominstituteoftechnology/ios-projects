//: [Previous](@previous)

import Foundation

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
    var permission: Bool = false
    
    init (lhs: Spoon, rhs: Spoon, name: String) {
        self.leftSpoon = lhs
        self.rightSpoon = rhs
        self.name = name
    }
    
    func getPermission() {
        Waiter.shared.givePermission(to: self)
//        print("\(name) has permission.")
    }
    
    func think() {
        getPermission()
        if permission {
            leftSpoon.pickUp()
            rightSpoon.pickUp()
        }
    }
    
    func eat() {
        print("\(name) is eating.")
        usleep(UInt32.random(in: 1...1000))
        leftSpoon.putDown()
        rightSpoon.putDown()
        Waiter.shared.releasePermission(from: self)
    }
    
    func run() {
        for _ in 0..<1000 {
            think()
            eat()
        }
    }
}

class Waiter {
    static let shared = Waiter()
    let lock = NSLock()
    
    func givePermission(to developer: Developer) {
            lock.lock()
            developer.permission = true
    }
    
    func releasePermission(from developer: Developer) {
        developer.permission = false
        lock.unlock()
    }
}

let developer1 = Developer(lhs: Spoon(), rhs: Spoon(), name: "Dev1")
let developer2 = Developer(lhs: Spoon(), rhs: developer1.leftSpoon, name: "Dev2")
let developer3 = Developer(lhs: Spoon(), rhs: developer2.leftSpoon, name: "Dev3")
let developer4 = Developer(lhs: Spoon(), rhs: developer3.leftSpoon, name: "Dev4")
let developer5 = Developer(lhs: developer1.rightSpoon, rhs: developer4.leftSpoon, name: "Dev5")

let developers = [developer1, developer2, developer3, developer4, developer5]

DispatchQueue.concurrentPerform(iterations: 5) { developers[$0].run() }


//: [Next](@next)
