

import UIKit

class ImageTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
   
    let tableViewCell = TableViewCell()
    
    // Amount of time for transition
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    // Animates the transition
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        // Get access to the view controllers
        guard let fromTableViewCell = transitionContext.viewController(forKey: .from) as? UITableViewController,
            let toDetailViewController = transitionContext.viewController(forKey: .to) as? UIViewController,
            let toView = transitionContext.view(forKey: .to) else {
                return
        }
        
        //let sourceLabel = fromTableViewCell.friendNameLabel
        
    }
    
    
    
}
