import UIKit

class Model {
    static let shared = Model()
    private init() {}

    var friends: [Friend] = []

    
    func count() -> Int {
        return friends.count
    }
    
    func friend(forIndex index: Int) -> Friend {
        return friends[index]
    }
}
