import UIKit

class TableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "personcell"
    
    @IBOutlet weak var friendImage: UIImageView!
    
    @IBOutlet weak var friendNameLabel: UILabel!
    
}
