
import UIKit

class ImageTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
//        // Method to get access to previous view controller
//        guard let fromVC = transitionContext.viewController(forKey: .from) as? TableViewController,
//            let toVC = transitionContext.viewController(forKey: .to) as? DetailViewController,
//            let toView = transitionContext.view(forKey: .to) else {
//                return
//        }
    }
    
    // MARK: - Reference Properties
    
    // Properties for the views that the animator will need to know about
    // Provide a place to hold the information later
    var sourceImage: UIImageView!
    var sourceLabel: UILabel!
    var destinationImage: UIImageView!
    var destinationLabel: UILabel!
    
}
