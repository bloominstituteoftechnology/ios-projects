import UIKit

class Spoon {
    
    private var lock = NSLock()
    var id: Int?
    
    func pickUp(){
        lock.lock()
    }
    
    func putDown(){
        lock.unlock()
    }
}


class Developer {
    
    var id: Int?
    var leftSpoon: Spoon?
    var rightSpoon: Spoon?
    
    func think() {
        leftSpoon!.pickUp()
        rightSpoon!.pickUp()
        return
    }
    
    func eat() {
        print("dev \(self.id) is eating")
        usleep(UInt32.random(in: 1...1000))
        print("dev \(self.id) finished eating")
        return
    }
    
    func run() {
        self.think()
        self.eat()
        rightSpoon?.putDown()
        leftSpoon?.putDown()
    }
}

var spoons : [Spoon] = []
var devs : [Developer] = []
var id = 1
while id <= 5 {
    let newSpoon = Spoon()
    newSpoon.id = id
    spoons.append(newSpoon)
    let newDev = Developer()
    newDev.id = id
    devs.append(newDev)
    id += 1
}

var i = 0
for i in 0..<5 {
    if i == 0 {
        devs[0].leftSpoon = spoons[4]
        devs[0].rightSpoon = spoons[0]
    }
    if i > 0  && i < 4 {
    devs[i].leftSpoon = spoons[i - 1]
    devs[i].rightSpoon = spoons[i]
    } else {
        devs[i].leftSpoon = spoons[i - 1]
        devs[i].rightSpoon = spoons[i]
    }
}



DispatchQueue.concurrentPerform(iterations: 12) {
    devs[$0].run()
}


