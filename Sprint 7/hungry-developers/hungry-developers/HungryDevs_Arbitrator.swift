//
//  HungryDevelopers.swift
//  hungry-developers
//
//  Created by De MicheliStefano on 05.09.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

import Foundation

func initHungryDevelopers1() {
    var developers: [Developer] = stride(from: 0, to: 5, by: 1).map { i in Developer(with: i) }
    var spoons: [Spoon] = stride(from: 0, to: 5, by: 1).map { i in Spoon(with: i) }
    
    developers[4].rightSpoon = spoons[0]; developers[0].leftSpoon = spoons[0]
    developers[0].rightSpoon = spoons[1]; developers[1].leftSpoon = spoons[1]
    developers[1].rightSpoon = spoons[2]; developers[2].leftSpoon = spoons[2]
    developers[2].rightSpoon = spoons[3]; developers[3].leftSpoon = spoons[3]
    developers[3].rightSpoon = spoons[4]; developers[4].leftSpoon = spoons[4]
    
    let waiter = Waiter()
    waiter.spoons = spoons
    
    DispatchQueue.concurrentPerform(iterations: 5) {
        developers[$0].run()
    }
}

class Waiter {

    static let shared = Waiter()
    var spoons: [Spoon]!

    func askPermission(toUse spoon1: Spoon, and spoon2: Spoon) -> Bool {
        if checkAvailability(for: spoon1) && checkAvailability(for: spoon2) {
            DispatchQueue.main.sync {
                spoon1.isAvailable = false
                spoon2.isAvailable = false
            }
            
            return true
        }
        return false
    }
    
    func returnSpoons(_ spoon1: Spoon, _ spoon2: Spoon) {
        DispatchQueue.main.sync {
            spoon1.isAvailable = true
            spoon2.isAvailable = true
        }
    }
    
    private func checkAvailability(for spoonLookup: Spoon) -> Bool {
        for spoon in spoons {
            if spoon.index == spoonLookup.index && spoon.isAvailable {
                return true
            }
        }
        return false
    }
    
//    private func setAsAvailable(for spoonLookup: Spoon) {
//        for spoon in spoons {
//            if spoon.index == spoonLookup.index {
//                // do mutext: set to available
//            }
//        }
//    }

}

class Spoon1 {
    
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

class Developer1 {
    
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
            let permissionGranted = Waiter.shared.askPermission(toUse: leftSpoon, and: rightSpoon)
            
            if permissionGranted { return }
        } while true
        
    }
    
    func eat() {
        print("Developer \(number) started eating")
        
        // enjoy a quick bite for 5 microseconds
        usleep(5)
        
        // after having eaten a hearty meal, put down them spoons and return to thinking
        Waiter.shared.returnSpoons(leftSpoon, rightSpoon)
        
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
