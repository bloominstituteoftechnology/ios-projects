import Foundation

class Model {
    static let shared = Model()
    private init() {}
    
    enum Contact: String, CaseIterable {
        case dog = "Puggy"
    }
    
    func count() -> Int {
        return contacts.count
    }
    
    func contact(forIndex index: Int) -> Contact {
        return contacts[index]
    }
}
