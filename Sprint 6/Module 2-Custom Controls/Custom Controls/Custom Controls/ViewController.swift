import UIKit

class ViewController: UIViewController {
    
    @IBAction func updateRating(_ sender: CustomControl) {
        var starCount = 0
        if startCount == 1 {
        self.navigationItem.title = "User Rating: 1 Star"
        } else {
            self.navigationItem.title = "User Rating: \(starCount) Stars"
        }
    }
}

