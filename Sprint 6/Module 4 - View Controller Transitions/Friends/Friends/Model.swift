import Foundation

class Model {
    static let shared = Model()
    private init() {}
    
    var contacts: [Contact] = []
    
    func count() -> Int {
        return contacts.count
    }
    
    func contact(forIndex index: Int) -> Contact {
        return contacts[index]
    }
}
