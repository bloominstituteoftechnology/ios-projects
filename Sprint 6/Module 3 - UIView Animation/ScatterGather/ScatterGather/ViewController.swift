import UIKit

class ViewController: UIViewController {
    var shouldScramble: Bool = false
    
    func scramble() {
        shouldScramble = !shouldScramble
    }
    
    @IBAction func toggle(_ sender: Any) {
        if shouldScramble == false {
            scatter()
        } else {
            gather()
        }
        scramble()
    }
    
    func scatter() {
        
    }
    
    func gather() {
        
    }
    
    
}

