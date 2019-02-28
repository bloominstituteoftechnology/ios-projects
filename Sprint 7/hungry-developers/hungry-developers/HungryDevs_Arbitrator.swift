//
//  HungryDevelopers.swift
//  hungry-developers
//
//  Created by De MicheliStefano on 05.09.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

import Foundation

func initHungryDevelopers1() {
    var developers: [Developer1] = stride(from: 0, to: 5, by: 1).map { i in Developer1(with: i) }
    var spoons: [Spoon1] = stride(from: 0, to: 5, by: 1).map { i in Spoon1(with: i) }

    developers[4].rightSpoon = spoons[0]; developers[0].leftSpoon = spoons[0]
    developers[0].rightSpoon = spoons[1]; developers[1].leftSpoon = spoons[1]
    developers[1].rightSpoon = spoons[2]; developers[2].leftSpoon = spoons[2]
    developers[2].rightSpoon = spoons[3]; developers[3].leftSpoon = spoons[3]
    developers[3].rightSpoon = spoons[4]; developers[4].leftSpoon = spoons[4]

    //let waiter = Waiter()

    for dev in developers {
        DispatchQueue.global().async {
            dev.run()
        }
    }
    
    dispatchMain()
}

class Waiter {

    static let shared = Waiter()
    private let lock = NSLock()

    func askPermission(toUse spoon1: Spoon1, and spoon2: Spoon1){
        lock.lock()
        spoon1.pickUp()
        spoon2.pickUp()
//        if spoon1.index < spoon2.index {
//            spoon1.pickUp(); spoon2.pickUp()
//        } else {
//            spoon2.pickUp(); spoon1.pickUp()
//        }
        lock.unlock()
    }

}


class Spoon1 {
    
    var index: Int
    private let lock = NSLock()
    
    init(with index: Int) {
        self.index = index
    }
    
    func pickUp() {
        print("Spoon \(index) is being picked up")
        lock.lock()
        print("Spoon \(index) was picked up")
    }
    
    func putDown() {
        print("Spoon \(index) is being put down")
        lock.unlock()
        print("Spoon \(index) was put down")
    }
    
}

class Developer1 {
    
    var number: Int
    var leftSpoon: Spoon1!
    var rightSpoon: Spoon1!
    
    init(with index: Int) {
        self.number = index
    }
    
    func think() {
        print("Developer \(number) asking for Permission")
        Waiter.shared.askPermission(toUse: leftSpoon, and: rightSpoon)
        print("Developer \(number) picked up spoons \(leftSpoon.index) and \(rightSpoon.index)")
        return
    }
    
    func eat() {
        
        print("Developer \(number) started eating with spoons \(leftSpoon.index) and \(rightSpoon.index)")
        usleep(5)
        
        leftSpoon.putDown()
        rightSpoon.putDown()
        print("Developer \(number) finished eating with spoons \(leftSpoon.index) and \(rightSpoon.index)")
        
        return
    }
    
    func run() {
        while true {
            think()
            eat()
        }
    }
    
}
