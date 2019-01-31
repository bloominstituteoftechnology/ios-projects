import Foundation

class Spoon {
    
    private let lock = NSLock()
    
    init(index: Int){
        self.index = index
    }
    
    let index: Int
    
    func pickUp(){
        lock.lock()
    }
    
    func putDown(){
        lock.unlock()
    }
}

class Developer {
    
    init(name: String, leftSpoon: Spoon, rightSpoon: Spoon) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
        self.name = name
    }
    
    // You pick your leftSpoon up, you put your leftSpoon down...
    let leftSpoon: Spoon
    let rightSpoon: Spoon
    let name: String
    
    // Put on your thinking caps!
    func think(){
        if self.leftSpoon.index > self.rightSpoon.index {
            print("\(name) started thinking...")
            self.leftSpoon.pickUp()
            print("\(name) picked up left spoon.")
            self.rightSpoon.pickUp()
            print("\(name) picked up right spoon.")
        }else {
            self.rightSpoon.pickUp()
            print("\(name) picked up right spoon.")
            self.leftSpoon.pickUp()
            print("\(name) picked up left spoon.")
        }
        print("\(name) finished thinking.")
    
        return
    }
    
    // Nom-Nom-Nom
    func eat(){
        print("\(name) started eating...")
        usleep(UInt32.random(in: 100_000 ... 1_000_000))
        self.leftSpoon.putDown()
        print("\(name) put down left spoon")
        self.rightSpoon.putDown()
        print("\(name) put down right spoon")
        print("\(name) finished eating.")
    }
    
    // Eat, Think, Run - to infinity and beyond...
    func run(){
        let infinity = 0
        while infinity == 0 {
            think()
            eat()
        }
    }
}

// MARK: - Initialize Spoons
var spoon0 = Spoon(index: 0)
var spoon1 = Spoon(index: 1)
var spoon2 = Spoon(index: 2)
var spoon3 = Spoon(index: 3)
var spoon4 = Spoon(index: 4)

// MARK: - Initialize Developers, assign spoons, load Developers into an array
var developer0 = Developer(name: "Developer 0", leftSpoon: spoon0, rightSpoon: spoon4)
var developer1 = Developer(name: "Developer 1", leftSpoon: spoon1, rightSpoon: spoon0)
var developer2 = Developer(name: "Developer 2", leftSpoon: spoon2, rightSpoon: spoon1)
var developer3 = Developer(name: "Developer 3", leftSpoon: spoon3, rightSpoon: spoon2)
var developer4 = Developer(name: "Developer 4", leftSpoon: spoon4, rightSpoon: spoon3)
var developerArray: [Developer] = [developer0, developer1, developer2, developer3, developer4]


DispatchQueue.concurrentPerform(iterations: 5) {devIndex in
    developerArray[devIndex].run()

}
