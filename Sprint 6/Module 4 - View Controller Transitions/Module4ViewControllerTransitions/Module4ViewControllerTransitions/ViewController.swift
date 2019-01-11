import UIKit

class ViewController: UIViewController {

    var friend: Friend?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friendDetailNameLabel.text = friend?.name
        
        friendDetailJobLabel.text = friend?.job
        
        friendDetailImageView.image = friend?.image
        
        friendDetailTitleLabel.title = friend?.name
        
    }
    
    @IBOutlet weak var friendDetailImageView: UIImageView!
    
    @IBOutlet weak var friendDetailNameLabel: UILabel!
    
    @IBOutlet weak var friendDetailJobLabel: UILabel!
    
    @IBOutlet weak var friendDetailTitleLabel: UINavigationItem!
    
}

