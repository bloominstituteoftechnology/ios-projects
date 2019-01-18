
import UIKit

class ImageTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        // Method to get access to previous view
        guard let toVC = transitionContext.viewController(forKey: .to),
            let fromView = transitionContext.view(forKey: .from),
            let toView = transitionContext.view(forKey: .to) else {
                return
        }
        
        // Get a container view
        let containerView = transitionContext.containerView
        
        let toViewEndFrame = transitionContext.finalFrame(for: toVC)
        // Add the view to the container view
        containerView.addSubview(toView)
        // Set it's frame so it's in the right place
        toView.frame = toViewEndFrame
        // Make destination start transparent so it's invisible
        toView.alpha = 0.0
        
        // Get source label on fromVC
        //let sourceLabel = fromView.
        
        // Hide before animation starts
        sourceLabel.alpha = 0.0
        sourceImage.alpha = 0.0
        sourceLabel.alpha = 0.0
        sourceLabel.alpha = 0.0
        
        // Create our own label that we will use to animate
        // Convert it's initial frame in terms of container view's coordinate system
        let labelInitialFrame = containerView.convert(sourceLabel.bounds, from: sourceLabel)
        // Create a label that will be animated
        let animatedLabel = UILabel(frame: labelInitialFrame)
        // Make sure it looks the same
        animatedLabel.text = sourceLabel.text
        animatedLabel.font = sourceLabel.font
        // Add it to the view
        containerView.addSubview(animatedLabel)
        
        // Create our own image that we will use to animate
        // Convert initial frame to container view's coordinate system
        let imageViewInitialFrame = containerView.convert(sourceImage.bounds, from: sourceImage)
        // Create an image that will be animated
        let animatedImage = UIImageView(frame: imageViewInitialFrame)
        // Make sure it looks the same
        animatedImage.contentMode = .scaleAspectFit
        animatedImage.image = sourceImage.image
        // Add it to the view
        containerView.addSubview(animatedImage)
        
    
        // Animate to the position of the destination label and image
        let duration = transitionDuration(using: transitionContext)
        
        // Update layout
        toView.layoutIfNeeded()
        
        UIView.animate(withDuration: duration, animations: {
            
            // Animate to position of destination label and image
            animatedLabel.frame = containerView.convert(self.destinationLabel.bounds, from: self.destinationLabel)
            animatedImage.frame = containerView.convert(self.destinationImage.bounds, from: self.destinationImage)
            
            toView.alpha = 1.0
            
        }) { (success) in
            
            // reset things
            self.sourceLabel.alpha = 1.0
            self.sourceImage.alpha = 1.0
            animatedLabel.removeFromSuperview()
            animatedImage.removeFromSuperview()
            
            toView.layoutIfNeeded()
            
            // the transition was NOT cancelled and completed
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            
        }
    }
    
    // MARK: - Reference Properties
    
    // Properties for the views that the animator will need to know about
    // Provide a place to hold the information later
    var sourceImage: UIImageView!
    var sourceLabel: UILabel!
    var destinationImage: UIImageView!
    var destinationLabel: UILabel!
    
}
