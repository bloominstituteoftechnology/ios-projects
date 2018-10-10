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
        if verbose { print("\(name) has permission.") }
    }
    
    func think() {
        if verbose { print("\(name) is thinking.") }
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
        if verbose { print("\(name) released permission") }
    }
    
    func run() {
        for _ in 0..<runTimes {
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

let runTimes = 10
let verbose = false
DispatchQueue.concurrentPerform(iterations: 5) { developers[$0].run() }

//: [Next](@next)
