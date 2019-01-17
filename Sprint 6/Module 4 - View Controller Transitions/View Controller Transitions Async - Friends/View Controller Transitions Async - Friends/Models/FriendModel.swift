
import UIKit

class FriendModel {
    
    // Singleton
    static let shared = FriendModel()
    private init() {}
    
    var friendArray: [Friend] = []
    
    func createFriend() {
        
        let karly: Friend = Friend(friendName: "Karly", friendImage: UIImage(named: "Karly")!, friendBio: "Running Coach, Founder of The Public Run Club \nCurrently lives in Tanzania, Africa")
        
        let meredith: Friend = Friend(friendName: "Meredith", friendImage: UIImage(named: "Meredith")!, friendBio: "Sister, Refugee Resettlement & Employment Specialist \nCurrently lives in Dehradun, India")
        
        let kate: Friend = Friend(friendName: "Kate", friendImage: UIImage(named: "Kate")!, friendBio: "Sister, Founder of Ibis Bakery \nCurrently lives in Kansas City, Kansas")
        
        let justine: Friend = Friend(friendName: "Justine", friendImage: UIImage(named: "Justine")!, friendBio: "Marketing Coordinator at DD Ford Construction \nCurrently lives in Austin, Texas")
        
        friendArray.append(karly)
        friendArray.append(meredith)
        friendArray.append(kate)
        friendArray.append(justine)
    }
    
    func numberOfFriends() -> Int {
        return friendArray.count
    }
    
    func friend(at index: Int) -> Friend {
        return friendArray[index]
    }
    

    
}
