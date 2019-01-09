import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var lastALabel: UILabel!
    @IBOutlet weak var lambdaView: UIImageView!
    
    @IBAction func toggle(_ sender: Any) {
        var shouldScramble: Bool = true
        
        let view1 = lLabel
        let view2 = aLabel
        let view3 = mLabel
        let view4 = bLabel
        let view5 = dLabel
        let view6 = lastALabel
        let view = lambdaView
        
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
                view3?.transform = CGAffineTransform(scaleX: 20.0, y: 20.0)
                
                view3?.frame.origin.x += 100
                view3?.frame.origin.y += 300
                view3?.backgroundColor = self.getRandomColor()
                view3?.textColor = self.getRandomColor()
            }
            //returning label m
            UIView.animate(withDuration: 1.0) {
                
                view3?.transform = .identity
            }
            //animating label d
            UIView.animate(withDuration: 1.0) {
                view3?.transform = CGAffineTransform(scaleX: 20.0, y: 20.0)
                
                view3?.frame.origin.x += 300
                view3?.frame.origin.y += 100
                view3?.backgroundColor = self.getRandomColor()
                view3?.textColor = self.getRandomColor()
            }
            //returning label d
            UIView.animate(withDuration: 1.0) {
                
                view3?.transform = .identity
            }
        }
        
        UIView.animateKeyframes(withDuration: 6.0, delay: 0.0, options: [], animations: animBlock, completion: nil)
    }
    func getRandomColor() -> UIColor {
        //Generate between 0 to 1
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
}

/*
 view.backgroundColor
 view.transform = CGAffineTransform  scale, rotationAngle (pi, or pie / 2.0), mutation
 .concatenating(CGAffineTransform
 
 might need this func
 func cleanup() {
 for subview in view.subviews {
 guard !(subview is UIToolbar) else { continue }
 subview.removeFromSuperview()
 }
 }
 
 */
