import Cocoa


class Spoon {
    private let lock = NSLock()
    
    var beingUsed: Bool = false
   
    func pickup() {
        print("Locking Spoon")
        beingUsed = true
        lock.lock()
    }
    
    func putDown() {
        print("Unlocking Spoon")
        lock.unlock()
        beingUsed = false
    }
}

class Developer {
    var leftSpoon: Spoon = Spoon()
    var rightSpoon: Spoon = Spoon()
    
    func think() {
        if !leftSpoon.beingUsed {
            print("Picking up Left Spoon")
            leftSpoon.pickup()
        }
        if !rightSpoon.beingUsed {
            print("Picking up Right Spoon")
            rightSpoon.pickup()
        }

    }
    
    func eat() {
        print("Eating")
        usleep(50000)
        print("Putting Down Right Spoon")
        rightSpoon.putDown()
        print("Putting Down Left Spoon")
        leftSpoon.putDown()
    }
    
    func run() {
        while(true) {
            think()
            eat()
        }
    }
}

let spoonOne = Spoon()
let spoonTwo = Spoon()
let spoonThree = Spoon()
let spoonFour = Spoon()
let spoonFive = Spoon()

let developerOne = Developer()
let developerTwo = Developer()
let developerThree = Developer()
let developerFour = Developer()
let developerFive = Developer()

developerOne.leftSpoon = spoonOne
developerOne.rightSpoon = spoonFive
developerTwo.rightSpoon = spoonOne
developerTwo.leftSpoon = spoonTwo
developerThree.rightSpoon = spoonTwo
developerThree.leftSpoon = spoonThree
developerFour.rightSpoon = spoonThree
developerFour.leftSpoon = spoonFour
developerFive.rightSpoon = spoonFour
developerFive.rightSpoon = spoonFive

let developers: [Developer] = [developerOne, developerTwo, developerThree, developerFour, developerFive]

DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}
