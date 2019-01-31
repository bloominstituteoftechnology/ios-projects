//  Copyright © 2019 Frulwinn. All rights reserved.

import UIKit

class DetailViewController: UIViewController {
    
    var friend: Friend?
    
    @IBOutlet weak var friendView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

