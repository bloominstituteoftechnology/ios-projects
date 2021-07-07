import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lambdaView.alpha = 1.0
    }
    
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var lastALabel: UILabel!
    @IBOutlet weak var lambdaView: UIImageView!
    

//    func getlabelPositionX(for label: UILabel) -> CGFloat {
//        return label.frame.origin.x
//    }
    
// func randomInt(min: Int, max: Int) -> Int {         return min + Int(arc4random_uniform(UInt32(max - min + 1)))     }
    
    @IBAction func toggle(_ sender: Any) {
        var shouldScramble: Bool = true
        
        let view1 = lLabel
        let view2 = aLabel
        let view3 = mLabel
        let view4 = bLabel
        let view5 = dLabel
        let view6 = lastALabel
        let view = lambdaView
        
        if self.lambdaView.alpha == 0.0 {
            UIView.animate(withDuration: 1.5, delay: 0.5, options: .curveEaseIn, animations: {
                self.lambdaView.alpha = 1.0
            })
                
        } else {
            UIView.animate(withDuration: 2.0, delay: 0.5, options: .curveEaseOut, animations: {
                self.lambdaView.alpha = 0.0
            })
        }
        
        let animBlock = {
        
            
            //animating label L
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5) {
                view1?.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2.0)
                    .concatenating(CGAffineTransform(scaleX: 10.5, y: 10.5))
                view1?.backgroundColor = self.getRandomColor()
            }
            //returning label L to origin
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                view1?.transform = .identity
                view1?.textColor = self.getRandomColor()
            }
            //animating label a
            UIView.animate(withDuration: 1.0) {
                view2?.transform = CGAffineTransform(scaleX: 24.0, y: 24.0)
                view2?.backgroundColor = self.getRandomColor()
                view2?.textColor = self.getRandomColor()
            }
            //returning label a to origin
            UIView.animate(withDuration: 1.0) {
                view2?.transform = .identity
            }
            //animating label m
            UIView.animate(withDuration: 1.0) {
                view3?.transform = CGAffineTransform(translationX: -100, y: -300).rotated(by: CGFloat.pi)
                    .concatenating(CGAffineTransform(scaleX: 19.5, y: 19.5))
                view3?.backgroundColor = self.getRandomColor()
                view3?.textColor = self.getRandomColor()
            }
            //returning label m
            UIView.animate(withDuration: 1.0) {
                view3?.transform = .identity
            }
            //animating label b
            UIView.animate(withDuration: 1.0) {
                //view4?.transform = CGAffineTransform(scaleX: 20.0, y: 20.0)
                view4?.transform = CGAffineTransform(translationX: 100, y: 300).rotated(by: CGFloat.pi)
                .concatenating(CGAffineTransform(scaleX: 15.5, y: 15.5))
//                view4?.frame.origin.x -= 100
//                view4?.frame.origin.y -= 300
                view4?.backgroundColor = self.getRandomColor()
                view4?.textColor = self.getRandomColor()
            }
            //returning label b
            UIView.animate(withDuration: 1.0) {
                view4?.transform = .identity
            }
            //animating d
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.4) {
                view5?.transform = CGAffineTransform(translationX: 100, y: 300)
                //view5?.center = self.view.center
            }
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.2) {
                view5?.transform = CGAffineTransform(scaleX: 2.7, y: 1.6)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.2) {
                view5?.transform = CGAffineTransform(scaleX: 1.6, y: 2.7)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.15) {
                view5?.transform = CGAffineTransform(scaleX: 2.11, y: 1.9)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.85, relativeDuration: 0.15) {
                view5?.transform = .identity
            
                view5?.backgroundColor = self.getRandomColor()
                view5?.textColor = self.getRandomColor()
            }
            
            //animating label last a
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5) {
                view6?.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                    .concatenating(CGAffineTransform(scaleX: 10.5, y: 10.5))
                view6?.backgroundColor = self.getRandomColor()
            }
            //returning label a to origin
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                view6?.transform = .identity
                view6?.textColor = self.getRandomColor()
            }
        }
        
        UIView.animateKeyframes(withDuration: 6.0, delay: 0.0, options: [], animations: animBlock, completion: nil)
    }
    func getRandomColor() -> UIColor {
        //Generate between 0 to 1
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 0.5)
    }
}

