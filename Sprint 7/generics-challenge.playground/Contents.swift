import Foundation

struct CountedSet<Element>: ExpressibleByArrayLiteral where Element: Hashable {
    
    private var items = [Element : Int]()
    var count: Int {
        return items.count
    }
    
    var isEmpty: Bool {
        return count > 0 ? false : true
    }
    
    init(arrayLiteral: Element...) {
        for element in arrayLiteral {
            insert(element)
        }
    }
    
    mutating func insert(_ element: Element) {
        if let item = items[element] {
            items[element] = item + 1
        } else {
            items[element] = 1
        }
    }
    
    mutating func remove(_ element: Element) -> Int {
        if let item = items[element] {
            items[element] = item - 1
        }
        return items[element] ?? 0
    }
    
    mutating func contains(_ element: Element) -> Bool {
        return items.keys.contains(element)
    }
    
    func union(_ countedSet: CountedSet) -> CountedSet {
        var unionizedElements = self
        
        for element in countedSet.items.keys {
            if let item = unionizedElements.items[element] {
                unionizedElements.items[element] = item + countedSet[element]
            } else {
                unionizedElements.items[element] = countedSet[element]
            }
        }
        
        return unionizedElements
    }
    
    // Needs to be reworked
    func intersection(_ countedSet: CountedSet) -> CountedSet {
        var intersectedElements = self

        for element in countedSet.items.keys {
            if let item = intersectedElements.items[element] {
                intersectedElements.items[element] = item + countedSet[element]
            } else {
                intersectedElements.items[element] = countedSet[element]
            }
        }

        return intersectedElements
    }
    
    func substraction(_ countedSet: CountedSet) -> CountedSet {
        var substractedElements = self
        
        for element in countedSet.items.keys {
            if let item = substractedElements.items[element] {
                substractedElements.items[element] = item - countedSet[element]
            }
        }
        
        return substractedElements
    }
    
    func isDisjoint(_ countedSet: CountedSet) -> Bool {
        for element in countedSet.items.keys {
            if let item = items[element] {
                return false
            }
        }
        return true
    }
    
    subscript(_ member: Element) -> Int {
        if let item = items[member] {
            return item
        } else {
            return 0
        }
    }

}

extension Sequence where Element: Hashable {
    
}

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0
var myCountedSet2: CountedSet<Arrow> = [.iron, .iron]
var unionizedSet = myCountedSet.intersection(myCountedSet2)
unionizedSet[.iron]
myCountedSet[.iron] // 4
myCountedSet.isDisjoint(myCountedSet2)
