import Cocoa

struct CountedSet<Element: Hashable>: ExpressibleByArrayLiteral {
    
    mutating func insert(_ newElement: Element) {
        if let count = items[newElement] {
            items[newElement] = count + 1
        } else {
            items[newElement] = 1
        }
    }
    
    mutating func remove(_ element: Element) -> Int {
        if let count = items[element] {
            let newCount = count - 1
            items[element] = newCount
            return newCount
        } else {
            return 0
        }
    }
    
    func contains(_ element: Element) -> Bool {
        return items[element] != nil
    }
    
    init(arrayLiteral: Element...) {
        for element in arrayLiteral {
            insert(element)
        }
    }
    
    subscript(_ member: Element) -> Int {
        guard let count = items[member] else { return 0 }
        return count
    }
    
    var count: Int {
        return items.keys.count
    }
    
    var isEmpty: Bool {
        return count == 0 ? true : false
    }
    
    private(set) var items: [Element: Int] = [:]
}


enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0
