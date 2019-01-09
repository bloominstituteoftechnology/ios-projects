import Foundation

class Spoon {
    var inUse: Bool = false
    private var lock = NSLock()
    
    var number: Int?
    
    init(n: Int) {
        number = n
    }
    
    func pickUp() {
        lock.lock()
        if !inUse {
            inUse = true
            lock.unlock()
            return
        } else {
            pickUp()
        }
        
    }
    
    func putDown() {
        inUse = false
    }
}


class Developer {
    var leftSpoon: Spoon?
    var rightSpoon: Spoon?
    var number: Int?
    
    var hasLeftSpoon = false
    var hasRightSpoon = false
    
    init(n: Int) {
        number = n
    }
    
    
    func think() {
        var nOfSpoons = 0
        
        let lhs = leftSpoon!.number
        let rhs = rightSpoon!.number
        
        while !hasRightSpoon || !hasLeftSpoon {
            if nOfSpoons == 0 {
                // careful
                if lhs! < rhs! {
                    leftSpoon?.pickUp()
                    hasLeftSpoon = true
                    nOfSpoons += 1
                    
                } else if rhs! < lhs! {
                    rightSpoon?.pickUp()
                    hasRightSpoon = true
                    nOfSpoons += 1
                    
                }
            } else {
                // get spoon at all costs
                if !hasLeftSpoon {
                    leftSpoon?.pickUp()
                    hasLeftSpoon = true
                } else if !hasRightSpoon {
                    rightSpoon?.pickUp()
                    hasRightSpoon = true
                }
            }
        }
    }
        
    
    func eat() {
        
        let rand = Int.random(in: 100...500)
        usleep(useconds_t(rand))
        
        leftSpoon!.putDown()
        rightSpoon!.putDown()
    }
    
    func run() {
        print("Checking Developer \(number!) setup")
        if !allGood() {
            fatalError("Not Good")
        }
        print(" === Developer \(number!) Properly Setup === ")
        print("Developer \(number!) starting to run")
        repeat {
            think()
            print("Developer \(number!) starting to think")
            eat()
            print("======= Developer \(number!) starting to eat =======")
            
        } while true
    }
    
    
    func allGood() -> Bool {
        if leftSpoon != nil &&
            rightSpoon != nil &&
            !hasRightSpoon &&
            !hasLeftSpoon {
            return true
        }
        return false
    }
    
}

var spoons: [Spoon] = []
var developers: [Developer] = []

func setup(number: Int) {
    reset()
    let finalSpoon = Spoon(n: number)
    spoons.insert(finalSpoon, at: 0)
    
    let firstDeveloper = Developer(n: 1)
    let leftSpoon = Spoon(n: 1)
    firstDeveloper.leftSpoon = leftSpoon
    firstDeveloper.rightSpoon = finalSpoon
    
    spoons.insert(leftSpoon, at: 0)
    developers.append(firstDeveloper)
    
    for n in 2..<number {
        let developer = Developer(n: n)
        let newSpoon = Spoon(n: n)
        developer.leftSpoon = newSpoon
        developer.rightSpoon = spoons[0]
        spoons.insert(newSpoon, at: 0)
        developers.append(developer)
        }
    
    let finalDeveloper = Developer(n: number)
    finalDeveloper.leftSpoon = finalSpoon
    finalDeveloper.rightSpoon = spoons[0]
    developers.append(finalDeveloper)
    
}

func reset() {
    spoons = []
    developers = []
}

func startPrint() {
    var developerNum: [Int] = []
    for d in developers {
        developerNum.append(d.number!)
    }
    
    var spoonNum: [Int] = []
    for spoon in spoons {
        spoonNum.append(spoon.number!)
    }
    
    print("Developers: \(developerNum). Spoons: \(spoonNum)")
    print(" === Starting Multi-Thread === " )
}

setup(number: 5)
startPrint()

DispatchQueue.concurrentPerform(iterations: 5) { (i) in
    developers[i].run()
}

