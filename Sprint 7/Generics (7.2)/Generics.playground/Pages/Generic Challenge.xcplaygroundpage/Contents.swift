//: [Previous](@previous)

struct CountedSet<Element> where Element: Hashable {
    mutating func insert(element: Element) {
        if itemsDictionary.contains(where: { $0.key == element }) {
            itemsDictionary[element] = itemsDictionary[element]! + 1
        } else {
            itemsDictionary[element] = 1
        }
        items.insert(element, at: 0)
    }
    mutating func remove(element: Element) {
        if let index = items.firstIndex(where: { $0 == element }) {
            items.remove(at: index)
        }
        while itemsDictionary[element]! > 0 {
        itemsDictionary[element] = itemsDictionary[element]! - 1
        }
    }
    func count() -> Int {
        var count = 0
        guard !itemsDictionary.isEmpty else { return 0 }
        for (_, value) in itemsDictionary {
            if value > 0 {
            count += 1
            }
        }
        return count
    }
    subscript(_ member: Element) -> Int {
        guard let count = itemsDictionary[member] else { return 0 }
        return count
    }
    func isEmpty() -> Bool {
        return items.isEmpty
    }
    func contains(element: Element) -> Bool {
        return items.contains(element)
    }
    
    private var items: [Element] = []
    private var itemsDictionary: [Element: Int] = [:]
}

enum Arrow { case iron, wooden, elven, dwarven, magic, silver }

var aCountedSet = CountedSet<Arrow>()
aCountedSet.insert(element: .dwarven)
aCountedSet.insert(element: .iron)
aCountedSet[.dwarven]
aCountedSet.count()
aCountedSet.remove(element: .dwarven)
aCountedSet.count()
aCountedSet.isEmpty()
aCountedSet.remove(element: .iron)
aCountedSet.count()
aCountedSet.isEmpty()

