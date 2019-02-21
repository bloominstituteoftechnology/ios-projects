import UIKit

class TableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "friendcell"
    
    @IBOutlet weak var friendImage: UIImageView!
    
    @IBOutlet weak var friendNameLabel: UILabel!
    
    var friend: Friend?{
        
        // Any time this property changes...
        didSet{
            
            // Update the name and image
            updateViews()
        }
    }
    
    private func updateViews() {
        
        // Check to make sure there is a friend
        guard let friend = friend else { return }
        
        // Set up the cells
        friendNameLabel.text = friend.name
        friendImage.image = friend.friendImage
    }
    
}
