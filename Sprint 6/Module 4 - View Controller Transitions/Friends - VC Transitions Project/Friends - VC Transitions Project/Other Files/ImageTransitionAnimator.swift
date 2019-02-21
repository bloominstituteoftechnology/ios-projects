

import UIKit

class ImageTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    let tableViewCell = TableViewCell()
    let detailViewController = DetailViewController()
    
    // Amount of time for transition
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    // Animates the transition
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        // Get access to the view controllers
        guard let fromViewController = transitionContext.viewController(forKey: .from) as? UIViewController,
            let toDetailViewController = transitionContext.viewController(forKey: .to) as? UIViewController,
            let toView = transitionContext.view(forKey: .to) else { return }
        
        let containerView = transitionContext.containerView
        
        let destinationViewFrame = transitionContext.finalFrame(for: toDetailViewController)
        containerView.addSubview(toView)
        toView.frame = destinationViewFrame
        toView.alpha = 0
        
        // Get the source label and destination label from other view controllers
        let sourceLabel = tableViewCell.friendNameLabel
        let destinationLabel = detailViewController.nameLabel
        let sourceImage = tableViewCell.friendImage
        let destinationImage = detailViewController.friendImage
        
    }
    


        

    let navigationControllerDelegate = NavigationControllerDelegate()
    
    
}
