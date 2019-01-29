import UIKit
import Foundation

extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral: Element...) {
        self.init()
        for element in arrayLiteral {
            self.insert(element)
        }
    }
}

struct CountedSet<Element> where Element: Hashable {
    
    private var elements: [Element : Int] = [:]
    
    mutating func insert(_ element: Element){
        //if the element(key) exists already, add 1 to its count(value)
        if elements[element] != nil {
            let elementCount = elements[element]
            elements[element] = elementCount! + 1
        // otherwise, add the element(key) and set its initial count(value) to 1
        }else {
            elements[element] = 1
        }
        
    }

    mutating func remove(_ element: Element){
        guard elements[element] != nil else { return }
        
        elements[element] = nil
    }
    
    subscript(_ element: Element) -> Int {
        guard elements[element] != nil else { return 0 }
        return elements[element]!
    }
    
//    func countedSetIsEmpty() -> Bool{
//        return true
//    }
    
    func count(_ countedSet: Dictionary<Element, Int> ) -> Int{
        guard !countedSet.isEmpty else { return 0 }
        return countedSet.keys.count
       
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
