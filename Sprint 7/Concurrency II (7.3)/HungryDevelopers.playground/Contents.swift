import UIKit

let lock = NSLock()






class Spoon {
    
    let id = UUID().uuidString
    
    func pickUp() {
        lock.lock()
        return
    }
    func putDown() {
        lock.unlock()
        return
    }
}

class Developer {
    var developer: String?
    var rightSpoon: Spoon?
    var leftSpoon: Spoon?
    
    func think() {
        print("\(self.developer!) is thinking.")
        if self.developer?.count == 5 {
            print("\(self.developer!) is trying to pick up the right spoon.")
            rightSpoon?.pickUp()
            print("\(self.developer!) picked up the right spoon.")
            print("\(self.developer!) is trying to pick up the left spoon.")
            print(leftSpoon?.id)
            leftSpoon?.pickUp()
            print("\(self.developer!) picked up the left spoon.")
        } else {
            print("\(self.developer!) is trying to pick up the left spoon.")
            print(leftSpoon?.id)
            leftSpoon?.pickUp()
            print("\(self.developer!) picked up the left spoon.")
            print("\(self.developer!) is trying to pick up the right spoon.")
            rightSpoon?.pickUp()
            print(rightSpoon?.id)
            print("\(self.developer!) picked up the right spoon.")
        }
        
    }
    func eat() {
        print("\(self.developer!) is eating.")
        usleep(500)
        print("\(self.developer!) is trying to put down the right spoon.")
        rightSpoon?.putDown()
        print("\(self.developer!) put down the right spoon.")
        print("\(self.developer!) is trying to put down the left spoon.")
        leftSpoon?.putDown()
        print("\(self.developer!) put down the left spoon.")
        return
    }
    func run() {
        while true {
            think()
            eat()
        }
    }
}

var spoons: [Spoon] = []
var developers: [Developer] = []
for _ in 1...5 {
    let developer = Developer()
    let spoon = Spoon()
    developers.append(developer)
    spoons.append(spoon)
}



developers[0].rightSpoon = spoons[0]
developers[1].rightSpoon = spoons[1]
developers[2].rightSpoon = spoons[2]
developers[3].rightSpoon = spoons[3]
developers[4].rightSpoon = spoons[4]

developers[0].leftSpoon = spoons[1]
developers[1].leftSpoon = spoons[2]
developers[2].leftSpoon = spoons[3]
developers[3].leftSpoon = spoons[4]
developers[4].leftSpoon = spoons[0]

developers[0].developer = "Austin"
developers[1].developer = "Sam"
developers[2].developer = "Jared"
developers[3].developer = "Holly"
developers[4].developer = "Rebecca"

DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}

