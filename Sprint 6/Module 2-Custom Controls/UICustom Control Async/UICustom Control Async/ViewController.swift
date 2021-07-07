

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // Allows the control's client (the view controller) to receive updats about changes in the rating control
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        
        let numberOfStars: Int = ratingControl.value
        
        if numberOfStars > 1 {
            navigationItem.title = "User Rating: \(numberOfStars) stars"
        } else {
            navigationItem.title = "User Rating: \(numberOfStars) star"
        }
        

        
    }
    
}

