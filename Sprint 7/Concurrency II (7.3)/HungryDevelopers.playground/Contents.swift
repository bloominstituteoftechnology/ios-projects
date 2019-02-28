import UIKit

import Foundation

// 1
class Spoon {
    // 2
    func pickUp() {
        while isPickedUp { continue }
        lock.lock()
        isPickedUp = true
        lock.unlock()
    }
    
    func putDown() {
        lock.lock()
        isPickedUp = false
        lock.unlock()
    }
    
    private let lock = NSLock()
    private var isPickedUp: Bool = false
}
// 3
class Developer {
    
    init(leftSpoon: Spoon, rightSpoon: Spoon, developer: String) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
        self.developer = developer
    }
    // 5
    func think() {
        print("\(developer) is thinking.")
        usleep(useconds_t(Int.random(in: 1...1000)))
        
        leftSpoon.pickUp()
        print("\(developer) picked up left spoon.")
        
        rightSpoon.pickUp()
        print("\(developer) picked up right spoon.")
        
        return
    }
    // 6
    func eat() {
        print("\(developer) is eating.")
        usleep(useconds_t(Int.random(in: 1...1000)))
        
        leftSpoon.putDown()
        print("\(developer) put down left spoon.")
        
        rightSpoon.putDown()
        print("\(developer) put down right spoon.")
    }
    
    func run() {
        while true {
            think()
            eat()
        }
    }
    
    var leftSpoon: Spoon
    var rightSpoon: Spoon
    let developer: String
}

// 7
var spoon1 = Spoon()
var spoon2 = Spoon()
var spoon3 = Spoon()
var spoon4 = Spoon()
var spoon5 = Spoon()

var developer1 = Developer(leftSpoon: spoon1, rightSpoon: spoon2, developer: "Paul")
var developer2 = Developer(leftSpoon: spoon2, rightSpoon: spoon3, developer: "Nate")
var developer3 = Developer(leftSpoon: spoon3, rightSpoon: spoon4, developer: "Jaspal")
var developer4 = Developer(leftSpoon: spoon4, rightSpoon: spoon5, developer: "Frulwinn")
var developer5 = Developer(leftSpoon: spoon5, rightSpoon: spoon1, developer: "Julian")

let developers = [developer1, developer2, developer3, developer4, developer5]

DispatchQueue.concurrentPerform(iterations: 5) {
    // 8
    developers[$0].run()
    
}
