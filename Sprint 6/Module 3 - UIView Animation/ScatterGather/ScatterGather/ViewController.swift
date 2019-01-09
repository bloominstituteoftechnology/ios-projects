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
        let view3 = bLabel
        let view4 = dLabel
        let view5 = lastALabel
        let view = lambdaView
        
        let animBlock = {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5) {
                view1?.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2.0)
                    .concatenating(CGAffineTransform(scaleX: 6.5, y: 6.5))
                view1?.backgroundColor = .black
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                view1?.transform = .identity
                view1?.textColor = .white
            }
            
            UIView.animate(withDuration: 1.0) {
                view2?.transform = CGAffineTransform(scaleX: 19.0, y: 19.0)
                view2?.backgroundColor = .red
                view2?.textColor = .black
            }
            
            UIView.animate(withDuration: 1.5) {
                view2?.transform = .identity
                
                
            }
        }
            
        UIView.animateKeyframes(withDuration: 6.0, delay: 0.0, options: [], animations: animBlock, completion: nil)
        }
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
