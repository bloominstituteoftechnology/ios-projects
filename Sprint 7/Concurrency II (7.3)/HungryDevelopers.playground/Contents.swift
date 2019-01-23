import UIKit

let firstLock = NSLock()
let secondLock = NSLock()





class Spoon {
    var isPickedUp: Bool = false
    func pickUp() {
        isPickedUp = true
        return
    }
    func putDown() {
        isPickedUp = false
        return
    }
}

var spoons : [Spoon] = []
for _ in 1...5 {
    let spoon = Spoon()
    spoons.append(spoon)
}


class Developer {
    
    var id: Int?
    var rightSpoon: Spoon?
    var leftSpoon: Spoon?
    let dragonTalesIsCool = true
    func think() {
        guard let id = self.id else {return}
        if id == 4 {
            firstLock.lock()
        spoons[id].pickUp
            secondLock.lock()
        spoons[0]
        return
        } else {
            firstLock.lock()
            spoons[id].pickUp
            secondLock.lock()
            spoons[id + 1]
        }
    }
    func eat() {
        guard let id = self.id else {return}
        usleep(500)
        if id == 4 {
            
            spoons[id].putDown()
            firstLock.unlock()
            
            spoons[0].putDown()
            secondLock.unlock()
            return
        } else {
            spoons[id].putDown()
            firstLock.unlock()
            spoons[id + 1].putDown()
            secondLock.unlock()
        }
        return
    }
    func run() {
        while dragonTalesIsCool {
            think()
            eat()
        }
    }
}

var developers: [Developer] = []
var id = -1
for _ in 1...5 {
    let developer = Developer()
    developer.id = id + 1
    id += 1
    developers.append(developer)
}

DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}

