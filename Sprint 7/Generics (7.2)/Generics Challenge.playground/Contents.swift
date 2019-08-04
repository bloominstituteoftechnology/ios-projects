import UIKit

struct CountedSet<Element>: ExpressibleByArrayLiteral where Element: Hashable{
    
    init(arrayLiteral elements: Element...) {
        for element in elements {
            insert(element: element)
        }
    }
    
    subscript(_ member: Element) -> Int {
        if let elementCount = elements[member] {
            return elementCount
        } else {
            return 0
        }
    }
    
    mutating func insert(element: Element) {
        if elements.isEmpty {
            elements[element] = 1
        } else if let elementCount = elements[element] {
            elements[element] = elementCount + 1
        }
    }
    
    mutating func remove(_ element: Element) {
        if let elementCount = elements[element] {
            elements[element] = elementCount - 1
        }
    }
    
    var count: Int {
        return elements.count
    }
    
    var isEmpty: Bool {
        return count == 0
    }
    
    //A dictionary of the elements and their individual counts.
    private(set) var elements: [Element : Int] = [:]

    
}

//Test Code
enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron)
myCountedSet[.iron] // 3
myCountedSet.remove(.dwarvish)
myCountedSet[.dwarvish] // 0
myCountedSet.remove(.magic)
myCountedSet[.magic] // 0
