/*Generics Challenge
 Create a generic CountedSet struct that is constrained to Hashable elements.
 A counted set is an unordered collection of  unique elements that may appear
 more than once in the collection.
 */

// Questions


import Cocoa
struct CountedSet<Element>: ExpressibleByArrayLiteral where Element: Hashable {
   
    // Use a private dictionary as your backing storage for set
    // members and their counts.
    private var dictionary: [Element: Int] = [:]
    
 
   
    mutating func insert(_ element: Element) {
        // Something old
        if let someValue = dictionary[element] {
            let newValue = someValue + 1
            dictionary[element] = newValue
        } else {
            // Something new
            dictionary[element] = 1
        }
    }
    
    // Remove Function
    // Same logic as insert, subtracting rather that adding
    mutating func remove(_ element: Element) -> Element? {
        // Something old
        if let someValue = dictionary[element] {
            let newValue = someValue - 1
            //only set it back in fif still a value
            if newValue > 0 {
                dictionary[element] = newValue
            } else {
                dictionary[element] = nil
            }
            return element
        } else {
            // Something new
            return nil
        }
    }
    

    // Computed property for count
    var count: Int {
        return dictionary.count
    }
    
    // Support subcripting
    subscript(_ element: Element) -> Int {
        // Return 0 for any value not found
        return dictionary[element] ?? 0
    }
    
    // isEmpty for when count is zero
    func isEmpty() -> Bool {
        if count == 0 {
            return true
        } else {
            return false
        }
    }
    

    //Conform to ExpressibleByArrayLitera to initialize
    init(arrayLiteral: Element...) {
        for element in arrayLiteral{
            insert(element)
        }
    }
    


    
    // https://developer.apple.com/documentation/swift/hashable
    // https://docs.swift.org/swift-book/LanguageGuide/Generics.html
}

// Conform to ExpressibleByArrayLiteral to initialize

enum Arrow {
    case iron
    case wooden
    case elven
    case dwarvish
    case magic
    case silver
}

var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
print(myCountedSet)
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0
