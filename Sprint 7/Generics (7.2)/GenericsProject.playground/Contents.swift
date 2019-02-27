import UIKit
import Foundation

struct CountedSet<Element: Hashable> {
    
    init(elements: [Element: Int]) {
        self.dictionary = elements
    }
    
    private var dictionary = Dictionary<Element, Int>()
    
    mutating func insert(_ element: Element){
        let duplicateElements = self.dictionary.filter { $0.key == element }
        self.dictionary[element] = duplicateElements.count+1
    }
    
    mutating func removal(_ element: Element){
        var newDictionary = self.dictionary
        let elementDictionary = self.dictionary.filter { $0.key == element }
        print(elementDictionary)
        if elementDictionary[element]! > 1{
            newDictionary[element] = (elementDictionary[element]! - 1)
            self.dictionary = newDictionary
            return
        }
        
        newDictionary = self.dictionary.filter { $0.key != element }
        
        self.dictionary = newDictionary
    }
}

var set1 = CountedSet(elements: ["a": 1, "b": 1, "c": 1])

print(set1)
set1.insert("d")
set1.insert("d")
print(set1)
set1.removal("d")
print(set1)
