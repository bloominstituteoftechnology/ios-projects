import UIKit

class ViewController: UIViewController {
    
    @IBAction func updateRating(ratingControl: CustomControl) {
        let n = ratingControl.value
        self.title = "User Rating: \(n) stars"
        //if else statement
        
    }

}

