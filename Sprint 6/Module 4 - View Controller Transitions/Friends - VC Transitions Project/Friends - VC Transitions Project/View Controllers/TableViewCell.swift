import UIKit

class TableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "personcell"
    
    @IBOutlet weak var friendImage: UIImageView!
    
    @IBOutlet weak var friendNameLabel: UILabel!
    
    var friend: Friend?
    
    private func updateViews() {
        guard let friend = friend else { return }
        
        // Set up the cells
        friendNameLabel.text = friend.name
        //friendImage.image = friend.image
    }
    
}
