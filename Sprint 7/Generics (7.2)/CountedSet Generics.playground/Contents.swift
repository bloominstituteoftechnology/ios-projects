import UIKit

struct CountedSet<Element: Hashable> {
    
    
    mutating func insert(_ newElement: Element) {
        if var count = dictSet[newElement]{
            count += 1
            dictSet[newElement] = count
        }else{
            dictSet[newElement] = 1
        }
        
    }
    
    mutating func remove(_ newElement: Element) {
        if var count = dictSet[newElement]{
            count -= 1
            if count == 0{
                dictSet.removeValue(forKey: newElement)
            }else {
                dictSet[newElement] = count
            }
        }
    }
    
    subscript(_ member: Element) -> Int{
        return dictSet[member] ?? 0
    }
    
    
    
    var count: Int {
        return dictSet.count
    }
    
    var isEmpty: Bool {
        return dictSet.isEmpty
    }
    
    private (set) var dictSet = [Element: Int]()
    
}

extension CountedSet: ExpressibleByArrayLiteral{
    init(arrayLiteral: Element...){
        for element in arrayLiteral{
            self.insert(element)
        }
    }
}


enum Arrow { case iron, wooden, elven, dwarvish, magic, silver}
var newCountedSet = CountedSet<Arrow>()
newCountedSet[.iron]

var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron]
myCountedSet.remove(.iron)
myCountedSet.remove(.dwarvish)
myCountedSet.remove(.magic)


