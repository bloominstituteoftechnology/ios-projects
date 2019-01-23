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
        
        if let index = items.index(forKey: member){
            return index.hashValue
        } else {
            return 0
        }
        
    }
    
    var count: Int {
        return items.count
    }
    
    private(set) var items: [Element:Int] = [:]
    
}

extension CountedSet : ExpressibleByArrayLiteral {

    init(){

        
        items = countedSet
        typealias ArrayLiteralElement = countedSet


        func removeDuplicates() -> [Element] {
            var seen: Set<Element> = []
            var result: [Element] = []
            for item in self {
                if seen.contains(item) == false {
                    seen.insert(item)
                    result.append(item)
                }
            }
            return result
        }
    }

}

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
print(aCountedSet)
