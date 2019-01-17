import UIKit

class ViewController: UIViewController {
    var shouldScramble: Bool = false
    
    var labelsArray: [UILabel] = []
    var lPosition: CGRect = UILabel().frame
    var aPosition: CGRect = UILabel().frame
    var mPosition: CGRect = UILabel().frame
    var bPosition: CGRect = UILabel().frame
    var dPosition: CGRect = UILabel().frame
    var aLastPosition: CGRect = UILabel().frame

    
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
            fadeLogo()
            
        } else {
            fadeLogo()
            
        }
        scramble()
    }
    
    func randomInt(min: Int, max: Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
        
    }
    
    func scatter() {
        let labelArray: [UILabel] = [lLabel, aLabel, mLabel, bLabel, dLabel, aLastLabel]
        labelsArray = labelArray
        lPosition = lLabel.frame
        aPosition = aLabel.frame
        mPosition = mLabel.frame
        bPosition = bLabel.frame
        dPosition = dLabel.frame
        aLastPosition = aLastLabel.frame
        
        for label in labelArray {
            let randCGFloatX = CGFloat.random(in: 0...340)
            let randCGFloatY = CGFloat.random(in: 0...650)
            let rect = CGRect(x: randCGFloatX, y: randCGFloatY, width: 80, height: 80)
            
            UIView.animate(withDuration: 3) {
                label.transform = CGAffineTransform(rotationAngle: CGFloat(self.randomInt(min: 1, max: 340)))
                label.transform = CGAffineTransform(scaleX: CGFloat(self.randomInt(min: 1, max: 4)), y: CGFloat(self.randomInt(min: 1, max: 4)))
                label.frame = rect
                label.backgroundColor = self.getRandomColor()
                label.textColor = self.getRandomColor()

            }
            

        
        }
    }
}
