import Foundation

struct CountedSet<Element> where Element: Hashable {
    
    private var items: [Element]
    var uniqueCount: Int
    var isEmpty: Bool

    init(_ elements: [Element]) {
        self.items = elements
        self.uniqueCount = 0
        self.isEmpty = false
        self.count()
    }
    
    mutating func insert(_ element: Element) {
        items.append(element)
    }
    
    mutating func remove(_ element: Element) -> Int {
        return items.filter { $0 == element }.count
    }
    
    mutating func count() -> Int {
        if items.count == 0 { self.isEmpty = true; return 0 }
        
        var uniqueItems: [Element] = []
        for item in items {
            if uniqueItems.contains(item) {
                uniqueItems.append(item)
            }
        }
        
        uniqueCount = uniqueItems.count
        return uniqueCount
    }
    
    subscript(_ member: Element) -> Int {
        var count = 0
        for item in items {
            if item == member {
                count += 1
            }
        }
        return count
    }
    
}

extension CountedSet: ExpressibleByArrayLiteral {
    
    init(arrayLiteral: Element...) {
        self.items = arrayLiteral
        self.uniqueCount = 0
        self.isEmpty = false
        self.count()
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

myCountedSet.count()
