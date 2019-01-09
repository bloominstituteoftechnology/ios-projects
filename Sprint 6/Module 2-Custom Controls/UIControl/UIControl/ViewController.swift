import UIKit

class ViewController: UIViewController {
    
    @IBAction func updateRating(ratingControl: CustomControl) {
        let n = ratingControl.value
        if n > 1 {
            self.title = "User Rating: \(n) stars"
        } else {
            self.title = "User Rating: \(n) star"
        }
    }
}
