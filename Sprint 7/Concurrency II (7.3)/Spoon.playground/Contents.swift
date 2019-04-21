//: Playground - noun: a place where people can play

import Cocoa

class Spoon {
    
    //bool to indicate state of spoon
    var lock = NSLock()
    
    //init spoon to false because that's the default state of spoon when not in use
    
    func pickUp() {
        lock.lock()
    }
    
    func putDown(){
      lock.unlock()
    }
}


class Developer{
    var rightSpoon: Spoon
    var leftSpoon: Spoon
    
    init(rightSpoon: Spoon, leftSpoon: Spoon){
        self.rightSpoon = rightSpoon
        self.leftSpoon = leftSpoon
    }
    
    func think() {
        rightSpoon.pickUp()
        leftSpoon.pickUp()
    }
    
    func eat(){
            usleep(100)
            rightSpoon.putDown()
            leftSpoon.putDown()
        }

    
    func run(){
        while true {
            self.think()
            self.eat()
        }
    }
}


//create 5 spoons and 5 developers
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




