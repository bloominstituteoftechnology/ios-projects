//  Copyright © 2019 Frulwinn. All rights reserved.

import UIKit

class ViewController: UIViewController {
    
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        let n = ratingControl.value
        
        if n > 1 {
            title = "User Rating: \(n) stars"
        } else {
            title = "User Rating: \(n) star"
        }
    }
}

