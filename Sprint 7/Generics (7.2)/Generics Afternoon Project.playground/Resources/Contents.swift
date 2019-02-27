import UIKit

// Create a generic CountedSet struct that is constrained to Hashable elements. A counted set is an unordered collection of unique elements that may appear more than once in the collection.
struct CountedSet<Element> where Element: Hashable {
    
    // Use a private dictionary as your backing storage for set members and their counts.
    private(set) var storage: [Element: Int] = [:]
    
    // Insert element
    mutating func insert(_ element: Element) {
        guard let item = storage[element] else { return }
        storage[element] = item + 1
    }
    
    // Remove element
    mutating func remove(_ element: Element) -> Int {
        
        guard let item = storage[element] else { return 0 }
        
        if storage[element]! > 0 {
            storage[element] = item - 1
        }
        
        return storage[element]!
    }
    
    // Support subscripting to look up current values, return 0 if one is not found.
    subscript(_ member: Element) -> Int {
        
    }
    
    
    // Count the amount of elements in the set and check if it's empty.
    
    // Conform to ExpressibleByArrayLiteral, perhaps via an extension
    
}
