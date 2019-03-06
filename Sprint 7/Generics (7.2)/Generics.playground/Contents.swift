import Foundation

enum Arrow {
    case iron
    case wooden
    case elven
    case dwarvish
    case magic
    case silver
}


struct CountedSet<Element> where Element: Hashable {
    
    // Storage for elements
    private(set) var elements: Dictionary<Element, Int> = [:]
    
    // Insert function
    mutating func insert(_ newItem: Element) {
        
        // Alternative using nil coalescing
//        let value = elements[newItem] ?? 0
//        elements[newItem] = value + 1
        
        // If something already exists in the dictionary
        // assign the existing new item's value (the count) to a variable
        if let someValue = elements[newItem] {
            
            // Add one to that value (count) and store it in a variable for the new value
            let newValue = someValue + 1
            
            // Give the newItem's value the new value
            elements[newItem] = newValue
        } else {
            // if the newItem doesn't exist in the dictionary
            // set the value of the new item to 1 (newItem: 1)
            elements[newItem] = 1
        }
        
    }
    
    // Remove function
    // Same logic as insert, subtracting rather than adding
    mutating func remove(_ item: Element) -> Element? {
        
        // Return nil if dictionary is empty b/c there's nothing to remove
        guard !elements.isEmpty else { return nil }
        
        // If the item exists in the dictionary
        // assign it's value (count) to someValue
        if let someValue = elements[item] {
            
            // the new value (count) of that item is one less
            let newValue = someValue - 1
            
            // only set it back in if still a value
            // if the value/count is greater than 0
            if newValue > 0 {
                
                // assign the item's value to the value that is one less
                elements[item] = newValue
            
            // if the value/count is now zero
            } else {
                
                // remove the item
                elements[item] = nil
            }
            // return the item - if it's nil that's okay because we are returning an optional Element
            return item
            
        // if the item isn't in the dictionary, return nil
        } else {
            return nil
        }
    }
    
    // Support subscripting
    subscript(_ member: Element) -> Int {
        
        // Return 0 for any value not found
        return elements[member] ?? 0
    }
    
    // Computed property for count
    var count: Int {
        return elements.count
    }
    
    // Computed property for isEmpty
    var isEmpty: Bool {
        if count > 0 {
            return false
        } else {
            return true
        }
    }
    
}

// Conform to ExpressibleByArrayLiteral to initialize
extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral: Element...) {
        self.init()
        for element in arrayLiteral {
            self.insert(element)
        }
    }
}


var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) //3
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0



enum Groceries {
    
    case kombucha
    case lemons
    case honey
    case greens
    case tomatoes
    case cheese
    
}

var groceryCountedSet = CountedSet<Groceries>()
groceryCountedSet[.kombucha]
var myGroceryCountedSet: CountedSet<Groceries> = [.lemons, .cheese, .greens, .kombucha, .honey, .lemons]
myGroceryCountedSet[.lemons]
myGroceryCountedSet.remove(.lemons)
myGroceryCountedSet[.lemons]


