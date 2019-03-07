//: Playground - noun: a place where people can play

import Foundation

struct CountedSet<Element> where Element: Hashable {
    
    mutating func insert(_ element: Element) {
        if var valueCount = dictionary[element] {
            valueCount += 1
            dictionary[element] = valueCount
        } else {
            dictionary[element] = 1
        }
    }
    
    mutating func remove(_ element: Element) {
        if var valueCount = dictionary[element] {
            valueCount -= 1
            if valueCount == 0 {
                dictionary.removeValue(forKey: element)
            } else {
            dictionary[element] = valueCount
            }
        }
    }
    
    subscript(_ member: Element) -> Int {
        return dictionary[member] ?? 0
    }
    
    var count: Int {
        return dictionary.count
    }
    var isEmpty: Bool {
        return dictionary.isEmpty
    }
    
    private(set) var dictionary = [Element: Int]()
}

extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral: Element...) {
        for element in arrayLiteral {
            self.insert(element)
        }
    }
}

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()

aCountedSet[.iron]

var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]

myCountedSet[.iron]
myCountedSet[.magic]
myCountedSet[.dwarvish]
myCountedSet[.silver]

myCountedSet.count

myCountedSet.remove(.iron)
myCountedSet.remove(.dwarvish)
myCountedSet.remove(.magic)

myCountedSet[.iron]
myCountedSet[.dwarvish]

myCountedSet.count

myCountedSet.remove(.magic)

myCountedSet[.magic]

myCountedSet.insert(.silver)
myCountedSet.insert(.wooden)
myCountedSet.insert(.elven)

myCountedSet[.silver]
myCountedSet[.wooden]
myCountedSet[.elven]

myCountedSet.count


