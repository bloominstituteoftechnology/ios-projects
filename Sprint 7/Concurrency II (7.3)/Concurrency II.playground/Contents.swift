import Foundation

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
    var dev: String
    init(rightSpoon: Spoon, leftSpoon: Spoon, dev: String){
        self.rightSpoon = rightSpoon
        self.leftSpoon = leftSpoon
        self.dev = dev
    }
    
    
    func think() {
        print("\(dev) is eating")
         if leftSpoon.index > rightSpoon.index {
            rightSpoon.pickUp()
            leftSpoon.pickUp()
         } else {
            leftSpoon.pickUp()
            rightSpoon.pickUp()
        }
    }
    
    func eat() {
        usleep(useconds_t(Int.random(in: 1...500)))
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

let spoon1 = Spoon(index: 1)
let spoon2 = Spoon(index: 2)
let spoon3 = Spoon(index: 3)
let spoon4 = Spoon(index: 4)
let spoon5 = Spoon(index: 5)

let developer1 = Developer(rightSpoon: spoon1, leftSpoon: spoon2, dev: "dev1")
let developer2 = Developer(rightSpoon: spoon2, leftSpoon: spoon3, dev: "dev2")
let developer3 = Developer(rightSpoon: spoon3, leftSpoon: spoon4, dev: "dev3")
let developer4 = Developer(rightSpoon: spoon4, leftSpoon: spoon5, dev: "dev4")
let developer5 = Developer(rightSpoon: spoon5, leftSpoon: spoon1, dev: "dev5")

let developers = [developer1, developer2, developer3, developer4, developer5]

DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}



