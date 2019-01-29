import UIKit

struct CountedSet<Element>: ExpressibleByArrayLiteral, Sequence, IteratorProtocol, Equatable where Element: Hashable {
    
    // MARK: - Initializer
    
    init(arrayLiteral: Element...) {
        for element in arrayLiteral {
            insert(element)
        }
    }
    
    
    // MARK: - Properties
    
    private(set) var storage: [Element: Int] = [:]
    
    var count: Int {
        return storage.count
    }
    
    var isEmpty: Bool {
        if count == 0 {
            return true
        } else {
            return false
        }
    }
    
    
    // MARK: - Subscript notation
    
    subscript(_ element: Element) -> Int {
        get {
            return storage[element] ?? 0
        }
    }
    
    
    // MARK: - Insert and remove
    
    mutating func insert(_ element: Element) {
        guard let int = storage[element] else {
            storage[element] = 1
            return
        }
        storage[element] = int + 1
    }
    
    mutating func remove(_ element: Element) -> Int {
        guard let int = storage[element] else { return 0 }
        if int == 1 {
            guard let index = storage.index(forKey: element) else { return 0 }
            storage.remove(at: index)
            return 0
        }
        storage[element] = int - 1
        return storage[element] ?? 0
    }
    
    // MARK: - Check if it contains an element
    
    func contains(_ element: Element) -> Bool {
        guard let _ = storage[element] else { return false }
        return true
    }
    
    
    // MARK: - Unions
    
    mutating func mutatingUnion(_ countedSet: CountedSet<Element>) {
        for element in countedSet {
            insert(element)
        }
    }
    
    func union(_ countedSet: CountedSet<Element>) -> CountedSet<Element> {
        var newCountedSet = CountedSet()
        newCountedSet.storage = storage
        for element in countedSet {
            newCountedSet.insert(element)
        }
        return newCountedSet
    }
    
    
    // MARK: - Intersection and subtraction
    
    func intersection(_ countedSet: CountedSet<Element>) -> CountedSet<Element> {
        var newCountedSet: CountedSet<Element> = []
        for element in countedSet {
            guard self.contains(element) else { continue }
            newCountedSet.insert(element)
        }
        return newCountedSet
    }
    
    func subtraction(_ countedSet: CountedSet<Element>) -> CountedSet<Element> {
        var newCountedSet: CountedSet<Element> = []
        for element in self {
            guard !self.contains(element) else { continue }
            newCountedSet.insert(element)
        }
        return newCountedSet
    }
    
    
    // MARK: - Equatability
    
    static func == (lhs: CountedSet<Element>, rhs: CountedSet<Element>) -> Bool {
        return lhs.storage == rhs.storage
    }
    
    
    // MARK: - Check if disjointed
    
    func isDisjointed() -> Bool {
        var new: CountedSet<Element> = []
        for element in self {
            for _ in 1...self[element] {
                new.insert(element)
            }
        }
        if self == new {
            return false
        } else {
            return true
        }
    }
    
    
    // MARK: - Allows for in loops
    
    mutating func next() -> Element? {
        guard let element = storage.first else { return nil }
        defer { storage.remove(at: storage.startIndex) }
        return element.key
    }
}


enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
    var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) //

   


