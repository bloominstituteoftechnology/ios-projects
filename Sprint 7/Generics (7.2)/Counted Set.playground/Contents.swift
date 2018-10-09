import UIKit

struct CountedSet<Element: Hashable>: ExpressibleByArrayLiteral, Sequence, IteratorProtocol, Equatable {
    
    // MARK: - Properties
    /// Private dictionary that holds the set
    private var items: [Element: Int] = [:] {
        didSet {
            itemKeys = Array(items.keys)
        }
    }
    /// Private utility variable for making the set iterable
    private var itemKeys: [Element] = []
    
    /// Returns the count of unique items in the set
    var count: Int {
        return items.keys.count
    }
    
    /// Returns a Bool that reflects whether or not the set is empty
    var isEmpty: Bool {
        return count < 1
    }
    
    // MARK: - Initializers
    init (_ items: [Element: Int]) {
        self.items = items
    }
    
    init(arrayLiteral elements: Element...) {
        for element in elements {
            insert(element)
        }
    }

    // MARK: - Sequence and Iterator Protocol
    mutating func next() -> (Element, Int)? {
        if let itemKey = itemKeys.popLast(),
            let itemValue = items[itemKey] { return (itemKey, itemValue) }
        return nil
    }
    
    // MARK: - Equatable
    static func == (lhs: CountedSet, rhs: CountedSet) -> Bool {
        for (element, count) in rhs {
            if !lhs.contains(element) || lhs[element] != count { return false }
        }
        return true
    }
    
    // MARK: - CRUD Methods
    /// Inserts one of the given element into the set
    mutating func insert(_ element: Element) {
        if let item = items[element] {
            items[element] = item + 1
        } else {
            items[element] = 1
        }
    }
    
    /// Removes one of an element from the set
    mutating func remove(_ element: Element) {
        if let item = items[element] { items[element] = item - 1 > 0 ? item - 1 : nil }
    }
    
    // MARK - Set Methods?
    /// Returns the count of the subscripted item
    subscript(_ member: Element) -> Int {
        if let item = items[member] {
            return item
        } else {
            return 0
        }
    }
    
    /// Checks to see if the given element is contained in the set
    func contains(_ element: Element) -> Bool {
        return items[element] != nil
    }
    
    /// Returns a new counted set that is the union of self and the given set
    func union(_ countedSet: CountedSet) -> CountedSet {
        var newSet = self
        for (element, count) in countedSet {
            for _ in 0..<count {
                newSet.insert(element)
            }
        }
        return newSet
    }
    
    /// Mutates a counted set by unioning the given set
    mutating func mutatingUnion(_ countedSet: CountedSet) {
        for (element, count) in countedSet {
            for _ in 0..<count {
                self.insert(element)
            }
        }
    }
    
    /// Returns a new counted set that is the intersection of self and the given set
    func intersection(_ countedSet: CountedSet) -> CountedSet {
        var newSet = CountedSet()
        for (element, count) in countedSet {
            if self.contains(element) && self[element] == count {
                for _ in 0..<count {
                    newSet.insert(element)
                }
            }
        }
        return newSet
    }
    
    /// Mutates a counted set by subtracting the given set
    mutating func subtraction(_ countedSet: CountedSet) {
        for (element, count) in countedSet {
            for _ in 0..<count {
                self.remove(element)
            }
        }
    }
    
    func isDisjoint(from countedSet: CountedSet) -> Bool {
        for (element, count) in countedSet {
            if self.contains(element) {
                return false
            }
        }
        return true
    }
    
}

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }

// MARK: - Tests
// Test initializing a new counted set with dictionary
var testSet = CountedSet(["Book" : 2, "House" : 1])
assert(testSet.count == 2)
assert(!testSet.isEmpty)

// Test inserting elements
testSet.insert("Tree")
testSet.insert("Tree")
assert(testSet.count == 3)
assert(testSet["Tree"] == 2)
assert(testSet["tree"] == 0)

// Test removing elements
testSet.remove("Book")
testSet.remove("Book")
assert(testSet.count == 2)
assert(testSet["Book"] == 0)
testSet.insert("Book")
assert(testSet["Book"] == 1)

// Test initializing an empty counted set with custom type
var aCountedSet = CountedSet<Arrow>()
assert(aCountedSet.isEmpty)
assert(aCountedSet[.iron] == 0)
aCountedSet.insert(.dwarvish)
aCountedSet.insert(.dwarvish)
aCountedSet.insert(.iron)

// Test initializing a counted set from Array literal
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
assert(myCountedSet[.iron] == 4)
myCountedSet.remove(.iron)
assert(myCountedSet[.iron] == 3)
myCountedSet.remove(.dwarvish)
assert(myCountedSet[.dwarvish] == 0)
myCountedSet.remove(.magic)
assert(myCountedSet[.magic] == 0)

// Test contains method
assert(myCountedSet.contains(.iron))
assert(!myCountedSet.contains(.dwarvish))

// Test union method
let unionSet = aCountedSet.union(myCountedSet)
assert(myCountedSet[.iron] == 3)
assert(myCountedSet[.dwarvish] == 0)
assert(unionSet[.iron] == 4)
assert(unionSet[.dwarvish] == 2)

// Test mutating union method
myCountedSet.mutatingUnion(aCountedSet)
assert(myCountedSet[.iron] == 4)
assert(myCountedSet[.dwarvish] == 2)

// Test equatable method
assert(myCountedSet == unionSet)
assert(myCountedSet != aCountedSet)

// Test intersection method
myCountedSet.remove(.dwarvish)
let intersectionSet = myCountedSet.intersection(unionSet)
assert(intersectionSet[.iron] == 4)
assert(!intersectionSet.contains(.dwarvish))

// Test subtraction method
myCountedSet.subtraction(intersectionSet)
assert(myCountedSet[.dwarvish] == 1)
assert(!myCountedSet.contains(.iron))

// Test isDisjoint method
assert(myCountedSet.isDisjoint(from: intersectionSet))
assert(!myCountedSet.isDisjoint(from: aCountedSet))
