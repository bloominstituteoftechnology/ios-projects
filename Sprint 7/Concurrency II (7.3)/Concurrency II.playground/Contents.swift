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
    
    
    var leftSpoon: Spoon
    var rightSpoon: Spoon
    
    init(rightSpoon: Spoon, leftSpoon: Spoon){
        self.rightSpoon = rightSpoon
        self.leftSpoon = leftSpoon
    }
    
    
    func think() {
            rightSpoon.pickUp()
            leftSpoon.pickUp()
        }
    
    func eat() {
        usleep(500)
        rightSpoon.putDown()
        leftSpoon.putDown()
     
    }
    
    func run() {
        while true {
        think()
        eat()
    }
  }
}

let spoon1 = Spoon()
let spoon2 = Spoon()
let spoon3 = Spoon()
let spoon4 = Spoon()
let spoon5 = Spoon()

let developer1 = Developer(rightSpoon: spoon1, leftSpoon: spoon2)
let developer2 = Developer(rightSpoon: spoon2, leftSpoon: spoon3)
let developer3 = Developer(rightSpoon: spoon3, leftSpoon: spoon4)
let developer4 = Developer(rightSpoon: spoon4, leftSpoon: spoon5)
let developer5 = Developer(rightSpoon: spoon5, leftSpoon: spoon1)

let developers = [developer1, developer2, developer3, developer4, developer5]

DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}



