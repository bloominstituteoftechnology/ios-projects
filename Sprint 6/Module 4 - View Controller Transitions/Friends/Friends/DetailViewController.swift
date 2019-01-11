import UIKit

class DetailViewController: UIViewController {

    var friend: Friend?
    
    @IBOutlet weak var contactView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let friend = friend else { return }
        //contactView.image = contact.image(UIImage)
        nameLabel.text = friend.name
        infoLabel.text = friend.info
    }
}

