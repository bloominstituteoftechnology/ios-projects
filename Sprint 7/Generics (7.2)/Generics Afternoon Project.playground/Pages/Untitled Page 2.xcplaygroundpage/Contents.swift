// Solution

/// An unordered collection of unique elements that
/// may appear more than once in the collection.
public struct CountedSet<Element: Hashable> {
    /// Inserts the given element to the set, with
    /// a count of 1 if the element is not yet present
    /// or adding 1 to the count if it is.
    @discardableResult
    public mutating func insert(_ member: Element) -> Int {
        _counts[member, default: 0] += 1
        return _counts[member]!
    }
    
    /// Removes one instance of the given element from
    /// the set. If the count goes to zero, the element is
    /// removed from the set. If the element is not present,
    /// the request is ignored.
    @discardableResult
    public mutating func remove(_ member: Element) -> Int {
        
        let memberCount = _counts[member, default: 0]
        guard memberCount > 0 else { return 0 }
        
        guard memberCount > 1 else { _counts.removeValue(forKey: member); return 0 }
        let newCount = _counts[member]! - 1
        _counts[member] = newCount
        
        return newCount
    }
    
    /// Access an element count, returning 0 for any
    /// element that does not appear in the counted set
    public subscript(_ member: Element) -> Int {
        return _counts[member, default: 0]
    }
    
    /// Return the number of unique elements in the counted set
    public var count: Int { return _counts.keys.count }
    
    /// A Boolean value that indicates whether the counted set is empty.
    public var isEmpty: Bool {
        return count == 0
    }
    
    internal var _counts: [Element: Int]
}

extension CountedSet: ExpressibleByArrayLiteral {
    //
    // `ExpressibleByArrayLiteral` conformance
    //
    
    /// Creates a counted set containing the elements of the given array literal.
    ///
    /// Do not call this initializer directly. It is used by the compiler when
    /// you use an array literal. Instead, create a new counted set using an array
    /// literal as its value by enclosing a comma-separated list of values in
    /// square brackets. You can use an array literal anywhere a set is expected
    /// by the type context.
    public init(arrayLiteral elements: Element...) {
        _counts = [:]
        for element in elements {
            _counts[element] = _counts[element, default: 0] + 1
        }
    }
}

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0
