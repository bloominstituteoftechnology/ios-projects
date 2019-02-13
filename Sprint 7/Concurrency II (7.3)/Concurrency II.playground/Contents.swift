import Foundation
import UIKit

class Spoon {
    
    var index: Int
  
    
    init(index: Int) {
        self.index = index
    }
    
    private let lock = NSLock()
    
    func pickUp() {
        lock.lock()
    }
    
    func putDown() {
        lock.unlock()
    }
    
}


class Developer {
    
    
    var leftSpoon: Spoon
    var rightSpoon: Spoon
    let dev: String
    
    
    init(leftSpoon: Spoon, rightSpoon: Spoon, dev: String) {
        self.rightSpoon = rightSpoon
        self.leftSpoon = leftSpoon
        self.dev = dev
    }
    
    
    func think() {
        print("\(dev) is thinking ")
        if leftSpoon.index < rightSpoon.index {
            print("\(dev) is thinking until the left spoon is available")
            leftSpoon.pickUp()
            print("\(dev) pick up left spoon")
            print("\(dev) is thinking until the right spoon is available")
            rightSpoon.pickUp()
            print("\(dev) pick up right spoon")
            
        } else {
            print("\(dev) is thinking until the right spoon is available")
            rightSpoon.pickUp()
            print("\(dev) pick up right spoon")
            print("\(dev) is thinking until the left spoon is available")
            leftSpoon.pickUp()
            print("\(dev) pick up left spoon")
            
        }
    }
    
    func eat() {
        
        
        print("\(dev) is eating")
        usleep(useconds_t(Int.random(in: 10000...150_000)))
        
        rightSpoon.putDown()
        print("\(dev) put down right spoon")
        
        leftSpoon.putDown()
        print("\(dev) put down left spoon")
    }
    
    func run() {
        
        while true {
            let startTime = Date()
            think()
            eat()
            let endTime = Date()
            let time = endTime.timeIntervalSinceReferenceDate -
                startTime.timeIntervalSinceReferenceDate
            print("\(dev) eating process takes \(time) seconds")
        }
    }
}

let spoon1 = Spoon(index: 1)
let spoon2 = Spoon(index: 2)
let spoon3 = Spoon(index: 3)
let spoon4 = Spoon(index: 4)
let spoon5 = Spoon(index: 5)

let developer1 = Developer(leftSpoon: spoon1, rightSpoon: spoon2, dev: "don1")
let developer2 = Developer(leftSpoon: spoon2, rightSpoon: spoon3, dev: "dev2")
let developer3 = Developer(leftSpoon: spoon3, rightSpoon: spoon4, dev: "dev3")
let developer4 = Developer(leftSpoon: spoon4, rightSpoon: spoon5, dev: "dev4")
let developer5 = Developer(leftSpoon: spoon5, rightSpoon: spoon1, dev: "dev5")

let developers = [developer1, developer2, developer3, developer4, developer5]


DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}



