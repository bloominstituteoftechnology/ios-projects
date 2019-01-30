//  Copyright © 2019 Frulwinn. All rights reserved.

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    var shouldScramble: Bool = false

    
    @IBAction func toggle(_ sender: Any) {
        
        if shouldScramble == true {
            scatter()
        } else {
            gather()
        }
        
    }
    
    func scatter() {
        
    }
    
    func gather() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

