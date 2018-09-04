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
    
    func union(_ newElementSet: [Element]) -> [Element : Int] {
        var unionizedElements: [Element : Int] = items
        
        for element in newElementSet {
            if let item = unionizedElements[element] {
                unionizedElements[element] = item + 1
            } else {
                unionizedElements[element] = 1
            }
        }
        
        return unionizedElements
    }
    
    mutating func mutatedUnion (_ newElementSet: [Element]) -> [Element] {
        for element in newElementSet {
            insert(element)
        }
        return items
    }
    
//    func intersection(_ newElementSet: [Element]) -> [Element : Int] {
//        var intersectedElements: [Element : Int] = []
//        for item in newElementSet {
//            if items.keys.contains(item) {
//
//            }
//        }
//        return intersectedElements
//    }
    
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
