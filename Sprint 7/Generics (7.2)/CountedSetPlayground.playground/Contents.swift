/**
 This code will cover the generics project for iOS4
 */

import UIKit
import Foundation

// A "FIFO" data structure
// FIFO = First in, First Out

struct CountedSet<Element> where Element: Hashable {
    
    mutating func insert(_ element: Element){
        // add the element to the dictionary
        if let currentValue = items[element] {
            items.updateValue(currentValue + 1, forKey: element)
        } else {
            items.updateValue(1, forKey: element)
        }
        
    }

    // remove
    mutating func remove(element: Element) -> Int{
        // find the given element and remove it
        if let currentValue = items[element] {
            if currentValue == 1 {
                items.removeValue(forKey: element)
                return 0
            } else {
                items.updateValue(currentValue - 1, forKey: element)
                return currentValue - 1
            }
        } else {
            return 0
        }
    }
    
    subscript(_ member: Element) -> Int{
        
        return items[member] ?? 0
        
    }
    
    var count: Int {
        return items.count
    }
    
    private(set) var items = [Element:Int]()
    
}

extension CountedSet : ExpressibleByArrayLiteral {

    init(arrayLiteral: Element...) {
        self.init()
        for element in arrayLiteral {
            self.insert(element)
        }
    }

}

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet.insert(.iron)
aCountedSet.insert(.iron)
aCountedSet[.iron]
aCountedSet.remove(element: .iron)
aCountedSet.remove(element: .iron)
aCountedSet.insert(.elven)
aCountedSet.insert(.elven)
aCountedSet.insert(.dwarvish)
aCountedSet.insert(.magic)
aCountedSet.insert(.magic)
aCountedSet.insert(.magic)

aCountedSet.count
aCountedSet[.elven]
aCountedSet[.dwarvish]
aCountedSet[.magic]
