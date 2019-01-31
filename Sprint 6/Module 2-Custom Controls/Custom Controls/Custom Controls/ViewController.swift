import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Please Update Rating Below"
    }
    
    // Follows both steps 7 & 8 of the README where `sender` is changed to `ratingControl`
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        if ratingControl.value == 0 {
            self.navigationItem.title = "User Rating: 1 Star"
        } else {
            self.navigationItem.title = "User Rating: \(ratingControl.value + 1) Stars"
        }
    }
    
}

