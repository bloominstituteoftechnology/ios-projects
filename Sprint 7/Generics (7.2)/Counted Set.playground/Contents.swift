import UIKit

struct CountedSet<Element: Hashable>: ExpressibleByArrayLiteral, Sequence, IteratorProtocol {
    private var items: [Element: Int] = [:] {
        didSet {
            itemKeys = Array(items.keys)
        }
    }
    private var itemKeys: [Element] = []
    
    var count: Int {
        return items.keys.count
    }
    
    var isEmpty: Bool {
        return count < 1
    }
    
    init (_ items: [Element: Int]) {
        self.items = items
    }
    
    init(arrayLiteral elements: Element...) {
        for element in elements {
            insert(element)
        }
    }

    mutating func next() -> (Element, Int)? {
        if let itemKey = itemKeys.popLast(),
            let itemValue = items[itemKey] { return (itemKey, itemValue) }
        return nil
    }
    
    mutating func insert(_ element: Element) {
        if let item = items[element] {
            items[element] = item + 1
        } else {
            items[element] = 1
        }
    }
    
    mutating func remove(_ element: Element) {
        if let item = items[element] { items[element] = item - 1 > 0 ? item - 1 : nil }
    }
    
    subscript(_ member: Element) -> Int {
        if let item = items[member] {
            return item
        } else {
            return 0
        }
    }
    
    func contains(_ element: Element) -> Bool {
        return items[element] != nil
    }
}

var testSet = CountedSet(["Book" : 2, "House" : 1])
assert(testSet.count == 2)
assert(!testSet.isEmpty)
testSet.insert("Tree")
testSet.insert("Tree")
assert(testSet.count == 3)
assert(testSet["Tree"] == 2)
assert(testSet["tree"] == 0)
testSet.remove("Book")
testSet.remove("Book")
assert(testSet.count == 2)
assert(testSet["Book"] == 0)
testSet.insert("Book")
assert(testSet["Book"] == 1)

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
assert(aCountedSet.isEmpty)
assert(aCountedSet[.iron] == 0)
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
assert(myCountedSet[.iron] == 4)
myCountedSet.remove(.iron)
assert(myCountedSet[.iron] == 3)
myCountedSet.remove(.dwarvish)
assert(myCountedSet[.dwarvish] == 0)
myCountedSet.remove(.magic)
assert(myCountedSet[.magic] == 0)

for (k,v) in myCountedSet {
    print("\(v) \(k) arrows")
}

assert(myCountedSet.contains(.iron))
assert(!myCountedSet.contains(.dwarvish))
