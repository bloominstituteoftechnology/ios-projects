import Foundation

struct CountedSet<Element: Hashable> {
    
    private var dict: [Element: Int] = [:]
    
    init(_ elements: Element...) {
        for item in elements {

            if let itemExists = dict[item] {
                dict[item] = itemExists + 1
            } else {
                dict[item] = 1
            }
        }
    }
    
    init() {
        dict = [:]
    }
    
    mutating func insert(_ newElement: Element) {
        if let itemExists = dict[newElement] {
            dict[newElement] = itemExists + 1
        } else {
            dict[newElement] = 1
        }
    }
    
    mutating func remove(_ element: Element) {
        guard let itemExists = dict[element] else {return}
        if itemExists > 1 {
            dict[element] = itemExists - 1
        } else {
            dict[element] = nil
        }
    }
 
    func count() -> Int? {
        return dict.keys.count
    }
    
    subscript(_ member: Element) -> Int {
        if let itemExists = dict[member] {
            return itemExists
        } else {
            return 0
        }
    }

    
}

extension CountedSet: ExpressibleByArrayLiteral {

    init(arrayLiteral: Element...) {
        self.init()
        for element in arrayLiteral {
            self.insert(element)
        }
    }
}



var someNumbers = CountedSet(1, 2, 3, 3, 3)
someNumbers.remove(1)
someNumbers.count()

someNumbers[3]
someNumbers[2]
someNumbers[7]


enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0
myCountedSet.count()
