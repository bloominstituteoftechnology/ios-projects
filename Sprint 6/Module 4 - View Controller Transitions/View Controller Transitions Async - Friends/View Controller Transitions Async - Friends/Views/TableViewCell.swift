
import UIKit

class TableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "friendcell"
    
    @IBOutlet weak var friendImageOutlet: UIImageView!
    
    @IBOutlet weak var friendNameOutlet: UILabel!
    
    var friend: Friend? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        
        // Make sure there is a friend
        guard let friend = friend else { return }
        
        // Set up the cell
        friendNameOutlet.text = friend.friendName
        friendImageOutlet.image = friend.friendImage

    }
    
    
}
