

import UIKit


class DetailViewController: UIViewController {
    
    @IBOutlet weak var navNameTitle: UINavigationBar!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var friendImage: UIImageView!

    
    var friend: Friend?
    
    private func updateViews() {
        guard let friend = friend else { return }
        
        // Set up the cells
        navNameTitle.topItem?.title = friend.name
        nameLabel.text = friend.name
        bioLabel.text = friend.bio
        
    }
}
