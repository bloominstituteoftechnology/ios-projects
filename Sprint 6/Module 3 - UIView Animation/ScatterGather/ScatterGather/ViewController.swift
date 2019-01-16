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
    
    func fadeLogo() {
        if self.lambdaView.alpha == 0.0 {
            UIView.animate(withDuration: 1.5, delay: 0.5, options: .curveEaseIn, animations: {
                self.lambdaView.alpha = 1.0
            })
            
        } else {
            UIView.animate(withDuration: 2.0, delay: 0.5, options: .curveEaseOut, animations: {
                self.lambdaView.alpha = 0.0
            })
        }
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
        fadeLogo()
       
            
    }
    
    func gather() {
        fadeLogo()
        
    }
}
