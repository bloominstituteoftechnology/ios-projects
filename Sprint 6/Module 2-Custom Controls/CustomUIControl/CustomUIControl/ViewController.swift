import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        switch CustomControl.value {
        case 1: title = "User Rating: \(CustomControl.value) star"
        default: title = "User Rating: \(CustomControl.value) stars"
        }
        
    }
    


}

