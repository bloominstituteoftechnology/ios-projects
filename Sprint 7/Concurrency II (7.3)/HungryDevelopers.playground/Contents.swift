import Foundation

class Spoon {
    
    private let lock = NSLock()
    
    func pickUp(){
        lock.lock()
        print("picked it up")
        //lock.unlock()
    }
    
    func putDown(){
        lock.unlock()
        print("put it down")
    }
}

class Developer {
    
    init(leftSpoon: Spoon, rightSpoon: Spoon) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    let leftSpoon: Spoon
    let rightSpoon: Spoon
    
    func think(){
        print("started thinking...")
        self.leftSpoon.pickUp()
        print("picked up left spoon")
        self.rightSpoon.pickUp()
        print("picked up right spoon")
        print("finished thinking...")
    
        return
    }
    
    func eat(){
        print("eating...")
        usleep(useconds_t(Int.random(in: 1 ... 5000)))
        self.leftSpoon.putDown()
        print("put down left spoon")
        self.rightSpoon.putDown()
        print("put down right spoon")
        print("done eating.")
    }
    
    func run(){
        let infinity = 0
        while infinity == 0 {
            think()
            eat()
        }
    }
}

var spoon0 = Spoon()
var spoon1 = Spoon()
var spoon2 = Spoon()
var spoon3 = Spoon()
var spoon4 = Spoon()
//var spoonArray: [Spoon] = [spoon0, spoon1, spoon2, spoon3, spoon4]

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
