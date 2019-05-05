import Cocoa

struct CountedSet<Element: Hashable> {
    
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

extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral: Element...) {
        for element in arrayLiteral {
            insert(element)
        }
    }
}

var x = 42

DispatchQueue.concurrentPerform(iterations: 2) { (_) in
    let scratch = x
    x += 1
    x = scratch
}

print(x)

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0
myCountedSet.contains(.dwarvish) // false
myCountedSet.contains(.magic) // true
var anotherCountedSet: CountedSet<Int> = [1,2,3,1,1,1,1,1,1,1,1,1]
anotherCountedSet[1]
