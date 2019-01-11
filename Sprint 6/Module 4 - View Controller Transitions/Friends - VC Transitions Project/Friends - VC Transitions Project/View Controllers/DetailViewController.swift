

import UIKit


class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var friendImage: UIImageView!

    // Instance of Model Friend
    var friend: Friend?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        // Check that the view is loaded
        guard isViewLoaded else { return }
        
        // Ensure we have a friend to present
        guard let friend = friend else { return }
        
        // Set up the cells
        navigationItem.title = friend.name
        friendImage.image = friend.friendImage
        nameLabel.text = friend.name
        bioLabel.text = friend.bio
        
    }
}
