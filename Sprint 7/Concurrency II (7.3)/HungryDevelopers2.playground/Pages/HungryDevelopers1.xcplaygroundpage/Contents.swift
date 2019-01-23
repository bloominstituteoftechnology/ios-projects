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
    
    let leftSpoon: Spoon
    let rightSpoon: Spoon
    let name: String
    
    func think(){
    
        leftSpoon.pickUp()
        print("\(self.name) has \(leftSpoon.name) for a left spoon.")
        rightSpoon.pickUp()
        print("\(self.name) has \(rightSpoon.name) for a right spoon.")
    }
    
    func eat(){
        print("\(self.name) started eating")
        
        usleep(UInt32.random(in: 1...5000000))
        
        leftSpoon.putDown()
        rightSpoon.putDown()
        print("**************** \(self.name) finished eating ****************")
    }
    
    func run(){
        for _ in 0..<10000 {
            think()
            eat()
        }
    }
    

}

var spoon1 = Spoon(name: "Spoon1", index: 1)
var spoon2 = Spoon(name: "Spoon2", index: 2)
var spoon3 = Spoon(name: "Spoon3", index: 3)
var spoon4 = Spoon(name: "Spoon4", index: 4)
var spoon5 = Spoon(name: "Spoon5", index: 5)

var developer1 = Developer(leftSpoon: spoon5, rightSpoon: spoon1, name: "Dev1")
var developer2 = Developer(leftSpoon: spoon1, rightSpoon: spoon2, name: "Dev2")
var developer3 = Developer(leftSpoon: spoon2, rightSpoon: spoon3, name: "Dev3")
var developer4 = Developer(leftSpoon: spoon3, rightSpoon: spoon4, name: "Dev4")
var developer5 = Developer(leftSpoon: spoon4, rightSpoon: spoon5, name: "Dev5")

var developers = [developer1, developer2, developer3, developer4, developer5]


DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}

