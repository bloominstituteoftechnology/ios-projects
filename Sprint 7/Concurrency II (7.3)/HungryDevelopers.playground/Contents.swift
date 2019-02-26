import UIKit

class Spoon {
    private let lock = NSLock()
    let index: Int
    init(index: Int) {
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
    
    var leftSpoon: Spoon
    var rightSpoon: Spoon
    var devNumber: String
    
    init(leftSpoon: Spoon, rightSpoon: Spoon, devNumber: String) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
        self.devNumber = devNumber
        
    }
    
    func think() {
        //pick both spoons before returning
        if leftSpoon.index < rightSpoon.index {
            leftSpoon.pickUp()
            rightSpoon.pickUp()

        } else {
            rightSpoon.pickUp()
            leftSpoon.pickUp()

        }
    }
    
    func eat() {
        //shoud pause for random amount of time before putting both spoons down usleep()
        let randomDelayTime = Int.random(in: 500..<2000)
        usleep(useconds_t(randomDelayTime * 1000))
    }
    
    func run() {
        //Developer.run() should call think() then eat() over and over again forever.
        while true {
            think()
            eat()
        }
        
    }
    
}
