//: [Previous](@previous)

import Foundation
import UIKit

class Spoon {
    
    private var lock: NSLock
    let name: String
    let index: Int
    func pickUp(){
        lock.lock()
    }
    
    func putDown(){
        lock.unlock()
    }
    
    
    
    init(name: String, index: Int) {
        self.lock = NSLock()
        self.name = name
        self.index = index
    }
}

class Developer {
    
    init (leftSpoon:Spoon, rightSpoon: Spoon, name: String) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
        self.name = name
    }
    
    func getPermission() {
        Waiter.shared.givePermission(to: self)
    }
    
    let leftSpoon: Spoon
    let rightSpoon: Spoon
    let name: String
    var permission: Bool = false
    
    func think(){
        getPermission()
        if permission {
            rightSpoon.pickUp()
            print("\(self.name) has \(rightSpoon.name) for a right spoon.")
            leftSpoon.pickUp()
            print("\(self.name) has \(leftSpoon.name) for a left spoon.")
        }
        
    }
    
    func eat(){
        print("\(self.name) started eating")
        
        usleep(UInt32.random(in: 1...5000000))
        
        leftSpoon.putDown()
        rightSpoon.putDown()
        Waiter.shared.releasePermission(from: self)
        print("**************** \(self.name) finished eating ****************")
    }
    
    func run(){
        think()
        eat()
    
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

var spoon1 = Spoon(name: "Spoon1", index: 1)
var spoon2 = Spoon(name: "Spoon2", index: 2)
var spoon3 = Spoon(name: "Spoon3", index: 3)
var spoon4 = Spoon(name: "Spoon4", index: 4)

var developer1 = Developer(leftSpoon: spoon4, rightSpoon: spoon1, name: "Dev1")
var developer2 = Developer(leftSpoon: spoon1, rightSpoon: spoon2, name: "Dev2")
var developer3 = Developer(leftSpoon: spoon2, rightSpoon: spoon3, name: "Dev3")
var developer4 = Developer(leftSpoon: spoon3, rightSpoon: spoon4, name: "Dev4")

var developers = [developer1, developer2, developer3, developer4]

while true {
    DispatchQueue.concurrentPerform(iterations: 4) {
        developers[$0].run()
    }
}


//: [Next](@next)
