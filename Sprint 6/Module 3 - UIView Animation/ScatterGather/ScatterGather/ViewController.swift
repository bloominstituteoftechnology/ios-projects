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
            //animating label b
            UIView.animate(withDuration: 1.0) {
                view4?.transform = CGAffineTransform(scaleX: 20.0, y: 20.0)
                
                view4?.frame.origin.x -= 100
                view4?.frame.origin.y -= 300
                view4?.backgroundColor = self.getRandomColor()
                view4?.textColor = self.getRandomColor()
            }
            //returning label b
            UIView.animate(withDuration: 1.0) {

                view4?.transform = .identity
            }
            //animating d
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.4) {
                view5?.center = self.view.center
            }
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.2) {
                view5?.transform = CGAffineTransform(scaleX: 6.7, y: 5.6)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.2) {
                view5?.transform = CGAffineTransform(scaleX: 5.6, y: 6.7)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.15) {
                view5?.transform = CGAffineTransform(scaleX: 6.11, y: 5.9)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.85, relativeDuration: 0.15) {
                view5?.transform = .identity
                
                view5?.backgroundColor = self.getRandomColor()
                view5?.textColor = self.getRandomColor()
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

/*
 might need this func
 func cleanup() {
 for subview in view.subviews {
 guard !(subview is UIToolbar) else { continue }
 subview.removeFromSuperview()
 }
 }
 */
