


import UIKit

struct CountedSet<Element> where Element: Hashable {

    
    // MARK: - Properties

    private(set) var storage: [Element: Int] = [:]

    var count: Int {
        return storage.count
    }

    var isEmpty: Bool {
        if count == 0 {
            return true
        } else {
            return false
        }
    }


    // MARK: - Subscript notation

    subscript(_ element: Element) -> Int {
        get {
            return storage[element] ?? 0
        }
    }


    // MARK: - Insert and remove

    mutating func insert(_ element: Element) {
        guard let int = storage[element] else {
            storage[element] = 1
            return
        }
        storage[element] = int + 1
    }

    mutating func remove(_ element: Element) -> Int {
        guard let int = storage[element] else { return 0 }
        if int == 1 {
            guard let index = storage.index(forKey: element) else { return 0 }
            storage.remove(at: index)
            return 0
        }
        storage[element] = int - 1
        return storage[element] ?? 0
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

    



enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
    var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]

myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) //


enum AppleProducts { case iPhone, iPad, iPod, MacBook, AppleTV }

var appleCountedSet = CountedSet<AppleProducts>()

appleCountedSet[.iPhone]
var myAppleCountedSet: CountedSet<AppleProducts> = [.iPhone, .iPad, .iPod, .iPhone, .iPad, .iPhone, .AppleTV]
myAppleCountedSet[.iPhone]
myAppleCountedSet.remove(.iPhone)
myAppleCountedSet.remove(.MacBook)
myAppleCountedSet.remove(.iPod)
myAppleCountedSet.remove(.iPhone)
