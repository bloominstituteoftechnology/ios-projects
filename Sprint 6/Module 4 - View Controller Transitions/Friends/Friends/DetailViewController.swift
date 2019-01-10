import UIKit

class DetailViewController: UIViewController {

    var contact: Contact?
    
    @IBOutlet weak var contactView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let contact = contact else { return }
        //contactView.image = contact.image(UIImage)
        nameLabel.text = contact.name
        phoneLabel.text = contact.phoneNumber
    }
}

