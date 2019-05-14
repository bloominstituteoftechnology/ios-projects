
import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var friendImageOutlet: UIImageView!
    
    @IBOutlet weak var friendNameOutlet: UILabel!
    
    @IBOutlet weak var friendBioOutlet: UILabel!
    
    // Instance of Model Friend
    var friend: Friend?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Check that view is loaded
        guard isViewLoaded else { return }
        
        // Check that we have a friend to present
        guard let friend = friend else { return }
        
        // Set up the cells
        navigationItem.title = friend.friendName
        friendNameOutlet.text = friend.friendName
        friendBioOutlet.text = friend.friendBio
        friendImageOutlet.image = friend.friendImage
    }
    
}
