import UIKit

class Animator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromTVC = transitionContext.viewController(forKey: .from) as? TableViewController,
        let toDVC = transitionContext.viewController(forKey: .to) as? DetailViewController,
            let toView = transitionContext.viewController(forKey: .to) else {
                return
        }
        
        let containerView = transitionContext.containerView
        
        let toViewEndFrame = transitionContext.finalFrame(for: toDVC)
        containerView.addSubview(toDVC)
        to
        
    }
    
    
}
