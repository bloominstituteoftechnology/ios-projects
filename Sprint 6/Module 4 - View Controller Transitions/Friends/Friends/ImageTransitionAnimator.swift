import UIKit

class ImageTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    var boolean: Bool = true
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 5.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        switch boolean {
        case true:
            boolean = false
        guard let sourceVC = transitionContext.viewController(forKey: .from) as? FriendsTableTableViewController,
            let destinationVC = transitionContext.viewController(forKey: .to) as? ViewController,
            let destinationView = transitionContext.view(forKey: .to) else {
                return
        }
        let containerView = transitionContext.containerView
        containerView.addSubview(destinationView)
        
        let destinationViewEndFrame = transitionContext.finalFrame(for: destinationVC)
        destinationView.frame = destinationViewEndFrame
        destinationView.alpha = 0.0
        
        let sourceLabel = sourceVC.nameLabel!
        let sourceImage = sourceVC.imageView!
        
        sourceLabel.alpha = 0.0
        sourceImage.alpha = 0.0
        
        let destinationLabel = destinationVC.friendName
        let destinationImage = destinationVC.friendImageView
        destinationLabel?.alpha = 0.0
        destinationImage?.alpha = 0.0
        
        let labelInitialFrame = containerView.convert((sourceLabel.bounds), from: sourceLabel)
        let imageInitialFrame = containerView.convert((sourceImage.bounds), from: sourceImage)
        
        let animatedLabel = UILabel(frame: labelInitialFrame)
        let animatedImage = UIImageView(frame: imageInitialFrame)
        animatedLabel.text = sourceLabel.text
        animatedLabel.font = sourceLabel.font
        animatedImage.image = sourceImage.image
        animatedImage.contentMode = .scaleAspectFit
        containerView.addSubview(animatedLabel)
        containerView.addSubview(animatedImage)
        
        let duration = transitionDuration(using: transitionContext)
        destinationView.layoutIfNeeded()
        UIView.animate(withDuration: duration, animations: {
            animatedLabel.frame = containerView.convert((destinationLabel?.bounds)!, from: destinationLabel)
            animatedImage.frame = containerView.convert(((destinationImage?.bounds)!), from: destinationImage)
            destinationView.alpha = 1.0
        }) { (success) in
            
            sourceLabel.alpha = 1.0
            sourceImage.alpha = 1.0
            
            animatedLabel.alpha = 0.0
            animatedImage.alpha = 0.0
            
            destinationImage?.alpha = 1.0
            destinationLabel?.alpha = 1.0
            
            animatedLabel.removeFromSuperview()
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
        case false:
            boolean = true
            guard let sourceVC = transitionContext.viewController(forKey: .from) as? ViewController,
                let destinationVC = transitionContext.viewController(forKey: .to) as? FriendsTableTableViewController,
                let destinationView = transitionContext.view(forKey: .to) else {
                    return
            }
            let containerView = transitionContext.containerView
            containerView.addSubview(destinationView)
            
            let destinationViewEndFrame = transitionContext.finalFrame(for: destinationVC)
            destinationView.frame = destinationViewEndFrame
            destinationView.alpha = 0.0
            
            let sourceLabel = sourceVC.friendName!
            let sourceImage = sourceVC.friendImageView!
            
            sourceLabel.alpha = 0.0
            sourceImage.alpha = 0.0
            
            let destinationLabel = destinationVC.nameLabel
            let destinationImage = destinationVC.imageView
            destinationLabel?.alpha = 0.0
            destinationImage?.alpha = 0.0
            
            let labelInitialFrame = containerView.convert((sourceLabel.bounds), from: sourceLabel)
            let imageInitialFrame = containerView.convert((sourceImage.bounds), from: sourceImage)
            
            let animatedLabel = UILabel(frame: labelInitialFrame)
            let animatedImage = UIImageView(frame: imageInitialFrame)
            animatedLabel.text = sourceLabel.text
            animatedLabel.font = sourceLabel.font
            animatedImage.image = sourceImage.image
            animatedImage.contentMode = .scaleAspectFit
            containerView.addSubview(animatedLabel)
            containerView.addSubview(animatedImage)
            
            let duration = transitionDuration(using: transitionContext)
            destinationView.layoutIfNeeded()
            UIView.animate(withDuration: duration, animations: {
                animatedLabel.frame = containerView.convert((destinationLabel?.bounds)!, from: destinationLabel)
                animatedImage.frame = containerView.convert(((destinationImage?.bounds)!), from: destinationImage)
                destinationView.alpha = 1.0
            }) { (success) in
                
                sourceLabel.alpha = 1.0
                sourceImage.alpha = 1.0
                
                animatedLabel.alpha = 0.0
                animatedImage.alpha = 0.0
                
                destinationImage?.alpha = 1.0
                destinationLabel?.alpha = 1.0
                
                animatedLabel.removeFromSuperview()
                
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        }
    }
}
