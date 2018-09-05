//
//  HungryDevelopers.swift
//  hungry-developers
//
//  Created by De MicheliStefano on 05.09.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

import Foundation

func initHungryDevelopers() {
    var developers: [Developer] = stride(from: 0, to: 5, by: 1).map { i in Developer(with: i) }
    var spoons: [Spoon] = stride(from: 0, to: 5, by: 1).map { i in Spoon(with: i) }

    developers[4].rightSpoon = spoons[0]; developers[0].leftSpoon = spoons[0]
    developers[0].rightSpoon = spoons[1]; developers[1].leftSpoon = spoons[1]
    developers[1].rightSpoon = spoons[2]; developers[2].leftSpoon = spoons[2]
    developers[2].rightSpoon = spoons[3]; developers[3].leftSpoon = spoons[3]
    developers[3].rightSpoon = spoons[4]; developers[4].leftSpoon = spoons[4]
    
    DispatchQueue.concurrentPerform(iterations: 5) {
        developers[$0].run()
    }
}


class Spoon {
    
    var index: Int
    var isAvailable: Bool = true
    private let lock = NSLock()
    
    init(with index: Int) {
        self.index = index
    }
    
    func pickUp() {
        lock.lock()
        isAvailable = false
        lock.unlock()
    }
    
    func putDown() {
        lock.lock()
        isAvailable = true
        lock.unlock()
    }
    
}

class Developer {
    
    var number: Int
    var usingLeftSpoon: Bool = false
    var usingRightSpoon: Bool = false
    var leftSpoon: Spoon!
    var rightSpoon: Spoon!
    
    init(with index: Int) {
        self.number = index
    }
    
    func think() {
        // continue thinking while either leftspoon or rightspoon are not yet available
        repeat {
            if leftSpoon.isAvailable && rightSpoon.isAvailable {
                if leftSpoon.index < rightSpoon.index {
                    leftSpoon.pickUp(); usingLeftSpoon = true
                } else {
                    rightSpoon.pickUp(); usingRightSpoon = true
                }
            }
            
            if leftSpoon.isAvailable { leftSpoon.pickUp(); usingLeftSpoon = true }
            if rightSpoon.isAvailable { rightSpoon.pickUp(); usingRightSpoon = true }
            
        } while !usingLeftSpoon && !usingRightSpoon
        
        // when both spoons have been picked up then return to eating
        return
    }
    
    func eat() {
        print("Developer \(number) started eating")
        
        // enjoy a quick bite for 5 microseconds
        usleep(5)
        
        // after having eaten a hearty meal, put down them spoons and return to thinking
        usingLeftSpoon = false; usingRightSpoon = false
        leftSpoon.putDown(); rightSpoon.putDown()
        
        print("Developer \(number) finished eating")
        return
    }
    
    func run() {
        while true {
            think()
            eat()
        }
    }
    
}
