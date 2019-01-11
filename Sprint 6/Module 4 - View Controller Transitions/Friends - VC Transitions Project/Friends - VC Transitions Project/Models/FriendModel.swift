

import UIKit

class FriendModel {
    
    static let shared = FriendModel()
    private init() {}
    
    // Array of Friends
    var friendArray: [Friend] = []
    
    func createFriend(){
        
        let karly = Friend(friendImage: UIImage(named: "Karly")!, name: "Karly", bio: "Running Coach, Founder of Public Run Club \nCurrently living in Tanzania")
        let kate = Friend(friendImage: UIImage(named: "Kate")!, name: "Kate", bio: "Sister, Founder of Ibis Bakery \nCurrently living in Kansas City")
        let meredith = Friend(friendImage: UIImage(named: "Meredith")!, name: "Meredith", bio: "Sister, Refugee Resettlement Specialist \nCurrently living in India")
        let justine = Friend(friendImage: UIImage(named: "Justine")!, name: "Justine", bio: "Marketing Coordinator at DD Ford Construction \nCurrently living in Austin, TX")
        
        friendArray.append(karly)
        friendArray.append(kate)
        friendArray.append(meredith)
        friendArray.append(justine)
    }
    
}

