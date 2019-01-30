import UIKit

class ViewController: UIViewController {
    
    // Follows both steps 7 & 8 of the README where `sender` is changed to `ratingControl`
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        if ratingControl.value == 1 {
            self.navigationItem.title = "User Rating: 1 Star"
        } else {
            self.navigationItem.title = "User Rating: \(ratingControl.value) Stars"
        }
    }
    
}

