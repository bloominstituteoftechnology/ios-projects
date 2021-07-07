import Foundation
import UIKit

class Model {
    static let shared = Model()
    
    var friendsList: [Friend] = []
    
    let spongeBob = Friend(name: "SpongeBob", job: "Patrick's Best Friend", image: #imageLiteral(resourceName: "9S4QWSR0"))
    let batman = Friend(name: "Batman", job: "I'm Batman", image: #imageLiteral(resourceName: "images-2"))
    
    func loadDummyFriends(){
        Model.shared.friendsList.append(batman)
        Model.shared.friendsList.append(spongeBob)
    }
    
    
}
