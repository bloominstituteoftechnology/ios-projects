import Foundation

class Spoon {
    
    private let lock = NSLock()
    
    func pickUp(){
        lock.lock()
    }
    
    func putDown(){
        lock.unlock()
    }
}

class Developer {
    
    init(leftSpoon: Spoon, rightSpoon: Spoon) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
    // You pick your leftSpoon up, you put your leftSpoon down...
    let leftSpoon: Spoon
    let rightSpoon: Spoon
    
    // Put on your thinking caps!
    func think(){
        print("started thinking...")
        self.leftSpoon.pickUp()
        print("picked up left spoon")
        self.rightSpoon.pickUp()
        print("picked up right spoon")
        print("finished thinking...")
    
        return
    }
    
    // Nom-Nom-Nom
    func eat(){
        print("eating...")
        usleep(useconds_t(Int.random(in: 500 ... 5000)))
        self.leftSpoon.putDown()
        print("put down left spoon")
        self.rightSpoon.putDown()
        print("put down right spoon")
        print("done eating.")
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
var spoon0 = Spoon()
var spoon1 = Spoon()
var spoon2 = Spoon()
var spoon3 = Spoon()
var spoon4 = Spoon()

// MARK: - Initialize Developers, assign spoons, load Developers into an array
var developer0 = Developer(leftSpoon: spoon0, rightSpoon: spoon4)
var developer1 = Developer(leftSpoon: spoon1, rightSpoon: spoon0)
var developer2 = Developer(leftSpoon: spoon2, rightSpoon: spoon1)
var developer3 = Developer(leftSpoon: spoon3, rightSpoon: spoon2)
var developer4 = Developer(leftSpoon: spoon4, rightSpoon: spoon3)
var developerArray: [Developer] = [developer0, developer1, developer2, developer3, developer4]


DispatchQueue.concurrentPerform(iterations: 5) {_ in
    //developerArray[$0].run()
    developer0.run()
    developer2.run()
    developer4.run()
    developer3.run()
    developer1.run()
    
}
