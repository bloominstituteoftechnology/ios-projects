import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate {
    
    
    var friend: Friend?
    var sourceCell: UITableViewCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(animator)
        nameLabel.text = friend?.name
        
        jobLabel.text = friend?.job
        
        imageView.image = friend?.image
        imageView.backgroundColor = .green
        
        friendDetailTitleLabel.title = friend?.name
        
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var jobLabel: UILabel!
    
    @IBOutlet weak var friendDetailTitleLabel: UINavigationItem!
    
    let animator = Animator()
}

