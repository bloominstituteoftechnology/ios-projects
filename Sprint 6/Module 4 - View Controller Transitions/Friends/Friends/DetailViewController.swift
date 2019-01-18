import UIKit

class DetailViewController: UIViewController {
    
    var friend: Friend?
    
    @IBOutlet weak var friendView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let friend = friend else { return }
        friendView.image = friend.imageFriend
        nameLabel.text = friend.name
        infoLabel.text = friend.info
        
    }
}

