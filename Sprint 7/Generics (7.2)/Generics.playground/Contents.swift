import UIKit

//Generics Challenge
//A counted set is an unordered collection of unique elements that may appear more than once in the collection.
// Create a generic CountedSet struct that is constrained to Hashable elements.
struct CountedSet<Element: Hashable> {

    // Use a private dictionary as your backing storage for set members and their counts.
    private var dictionary: [Element: Int] = [:]
    
//    Add insertion, insert one element at a time.
    mutating func insert(element: Element) {
        if let existingValue = dictionary[element] {
            let newValue = existingValue + 1
            dictionary[element] = newValue
        } else {
            dictionary[element] = 1
        }
    }
    
//    Add removal, remove one element at a time.
    mutating func remove(element: Element) -> Element? {
        if let existingValue = dictionary[element] {
            let revisedValue = existingValue - 1
            if revisedValue > 0 {
                dictionary[element] = revisedValue
            } else {
                dictionary[element] = nil
                return nil
            }
        }
        return element
    }
    
//    Support subscripting to look up current values (by implementing subscript(_ member: Element) -> Int).
//    Return 0 for any value that is not found.
    subscript(_ element: Element) -> Int {
        // Return 0 for any value not found
        return dictionary[element] ?? 0
    }
    
//    Add count, returning the number of unique elements in the counted set and isEmpty for when count is zero.
    func isEmpty() -> Bool {
        var count: Int {
            return dictionary.count
        }
        
        if count == 0 {
            return true
        } else {
            return false
        }
    }
}
// conform your set to ExpressibleByArrayLiteral so you can initialize a counted set using an array of same-type items.
//got this example from documentation
//extension OrderedSet: ExpressibleByArrayLiteral {
//    init(arrayLiteral: Element...) {
//        self.init()
//        for element in arrayLiteral {
//            self.append(element)
//        }
//    }
//}

extension CountedSet: ExpressibleByArrayLiteral {
    typealias ArrayLiteralElement = <#type#>
    
    init(element: Element) {
        self.init()
        for element in dictionary {
            self.append(element)
        }
    }
}

//var aCountedSet = CountedSet<Arrow>()
//aCountedSet[.iron] // 0
enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]

myCountedSet[.iron] // 4
myCountedSet.remove(element: .iron) // 3
myCountedSet.remove(element: .dwarvish) // 0
myCountedSet.remove(element: .magic) // 0
