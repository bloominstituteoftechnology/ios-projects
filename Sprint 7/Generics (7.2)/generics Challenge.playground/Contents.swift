import UIKit
import Foundation

struct CountedSet<Element: Hashable> {
    
    mutating func insert(element: Element) {
        let value = storage[element] ?? 0
            storage[element] = value + 1
    }
    
    mutating func remove(element: Element) -> Int {
        guard !storage.isEmpty else { return 0 }
        
        let value = storage[element] ?? 0
        if value == 0 {
            storage.removeValue(forKey: element)
        } else {
            storage[element] = value - 1
        }
        return storage[element] ?? 0
    }
    
    subscript(_ member: Element) -> Int {
        return storage[member] ?? 0
    }
    
    mutating func count() -> Int {
        return storage.isEmpty ? 0 : storage.count
    }
    
    private(set) var storage: [Element : Int] = [:]
}

extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral: Element...) {
        for element in arrayLiteral {
            self.insert(element: element)
        }
    }
}

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }

var aCountedSet = CountedSet<Arrow>()

aCountedSet[.iron] // 0
aCountedSet.insert(element: .iron)
aCountedSet[.iron] // 1
aCountedSet.count() // 1

var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]

myCountedSet[.iron] // 4
myCountedSet.remove(element: .iron) // 3
myCountedSet.remove(element: .iron) // 2
myCountedSet.remove(element: .dwarvish) // 0
myCountedSet.remove(element: .magic) // 0
myCountedSet.count() // 3
