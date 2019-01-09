import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        view.performFlare()
        switch CustomControl.starValue {
        case 1: title = "User Rating: \(CustomControl.starValue) star"
        default: title = "User Rating: \(CustomControl.starValue) stars"
        }
        
    }
    


}

