import UIKit

class ViewController: UIViewController {
    var shouldScramble: Bool = false
    
    @IBOutlet weak var lambdaView: UIImageView!
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var aLastLabel: UILabel!
    
    func scramble() {
        shouldScramble = !shouldScramble
    }
    
    //allows for random colors
    func getRandomColor() -> UIColor {
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: red, green: green, blue: blue, alpha: 0.5)
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

