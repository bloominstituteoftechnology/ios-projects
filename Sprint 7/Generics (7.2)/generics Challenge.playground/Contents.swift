import UIKit
import Foundation

struct CountedSet<Element: Hashable> {
    
    mutating func insert(element: Element) {
        let value = storage[element] ?? 0
            storage[element] = value + 1
    }
    
    mutating func remove(element: Element) {
        guard !storage.isEmpty else { return }
        
        let value = storage[element] ?? 0
        if value == 0 {
            storage.removeValue(forKey: element)
        } else {
            storage[element] = value - 1
        }
    }
    
    subscript(_ member: Element) -> Int {
        return storage[member] ?? 0
    }
    
    mutating func count() -> Int {
        return storage.isEmpty ? 0 : storage.count
    }
    
    private(set) var storage: [Element : Int] = [:]
}
