import UIKit

class Spoon {
    
    //Initialize a spoon with a index value.
    init(_ index: Int) {
        self.index = index
    }
    
    //Pick up spoon and don't let other developer use it.
    func pickUp() {
        lock.lock()
        isUsed = true
    }
    
    //Put down spoon and let another developer use it.
    func putDown() {
        lock.unlock()
        isUsed = false
    }
    
    //Properties of a spoon.
    private let lock = NSLock()
    var index: Int
    var isUsed: Bool = false
}

class Developer {
    
    //Initialize developer with number and 2 spoons: right and left.
    init(_ number: Int, rightSpoon: Spoon, leftSpoon: Spoon) {
        self.number = number
        self.rightSpoon = rightSpoon
        self.leftSpoon = leftSpoon
    }
    
    //When developer eats, they use one spoon and then the other.
    func eat() {
        print("\(number) is eating")
        usleep(UInt32.random(in: 1...1000))
        rightSpoon.putDown()
        usleep(UInt32.random(in: 1...1000))
        leftSpoon.putDown()
    }
    
    //When a developer thinks, they grab a spoon to be ready to eat.
    func think() {
        print("\(number) is thinking")
        if leftSpoon.index < rightSpoon.index {
            leftSpoon.pickUp()
            rightSpoon.pickUp()
        } else {
            rightSpoon.pickUp()
            leftSpoon.pickUp()
        }
    }
    
    //Each developer will run x number of times.
    func run() {
        for i in 1...1000 {
            think()
            eat()
        }
    }
    
    //Properties of a developer.
    var rightSpoon: Spoon
    var leftSpoon: Spoon
    var number: Int
}

class Waiter {
    func clearToUse(spoon: Spoon) -> Bool {
        return spoon.isUsed
    }
}

//Initialize 5 spoons
let spoon1 = Spoon(1)
let spoon2 = Spoon(2)
let spoon3 = Spoon(3)
let spoon4 = Spoon(4)
let spoon5 = Spoon(5)

//Initialize 5 developers who share 5 spoons.
let developer1 = Developer(1, rightSpoon: spoon2, leftSpoon: spoon1)
let developer2 = Developer(2, rightSpoon: spoon3, leftSpoon: spoon2)
let developer3 = Developer(3, rightSpoon: spoon4, leftSpoon: spoon3)
let developer4 = Developer(4, rightSpoon: spoon5, leftSpoon: spoon4)
let developer5 = Developer(5, rightSpoon: spoon1, leftSpoon: spoon5)

let spoons: [Spoon] = [spoon1, spoon2, spoon3, spoon4, spoon5]
let developers: [Developer] = [developer1, developer2, developer3, developer4, developer5]

//Perform task.
DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}
