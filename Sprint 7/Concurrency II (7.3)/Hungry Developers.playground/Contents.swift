import Cocoa


class Spoon {
    private let lock = NSLock()
    var index: Int
    var beingUsed: Bool = false
    
    init(index: Int) {
        self.index = index
    }
   
    func pickup() {
        print("Locking Spoon \(self.index)")
        beingUsed = true
        lock.lock()
    }
    
    func putDown() {
        print("Unlocking Spoon \(self.index)")
        lock.unlock()
        beingUsed = false
    }
}

class Developer {
    var leftSpoon: Spoon
    var rightSpoon: Spoon
    //var number: Int
    
    init(leftSpoon: Spoon, rightSpoon: Spoon) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
    func think() {
        if !leftSpoon.beingUsed && (leftSpoon.index > rightSpoon.index) {
            print("Picking up Left Spoon \(leftSpoon.index)")
            leftSpoon.pickup()
        }
        if !rightSpoon.beingUsed && (rightSpoon.index > leftSpoon.index) {
            print("Picking up Right Spoon \(rightSpoon.index)")
            rightSpoon.pickup()
        }

    }
    
    func eat() {
        print("Eating with left spoon \(leftSpoon.index) and right spoon \(rightSpoon.index)")
        usleep(500)
        print("Putting Down Right Spoon \(rightSpoon.index)")
        rightSpoon.putDown()
        print("Putting Down Left Spoon \(leftSpoon.index)")
        leftSpoon.putDown()
    }
    
    func run() {
        while(true) {
            think()
            eat()
        }
    }
}

let spoonOne = Spoon(index: 1)
let spoonTwo = Spoon(index: 2)
let spoonThree = Spoon(index: 3)
let spoonFour = Spoon(index: 4)
let spoonFive = Spoon(index: 5)

let developerOne = Developer(leftSpoon: spoonOne, rightSpoon: spoonFive)
let developerTwo = Developer(leftSpoon: spoonTwo, rightSpoon: spoonOne)
let developerThree = Developer(leftSpoon: spoonThree, rightSpoon: spoonTwo)
let developerFour = Developer(leftSpoon: spoonFour, rightSpoon: spoonThree)
let developerFive = Developer(leftSpoon: spoonFive, rightSpoon: spoonFour)

let developers: [Developer] = [developerOne, developerTwo, developerThree, developerFour, developerFive]

DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}
