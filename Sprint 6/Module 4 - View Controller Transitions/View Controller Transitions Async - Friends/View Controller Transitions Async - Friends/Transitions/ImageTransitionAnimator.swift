
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
    

    
    let tableViewCell = TableViewCell()
    
    lazy var sourceImage = tableViewCell.friendImageOutlet
    lazy var sourceName = tableViewCell.friendNameOutlet
    
    let detailViewController = DetailViewController()
    
    lazy var destinationImage = detailViewController.friendImageOutlet
    lazy var destinationName = detailViewController.friendNameOutlet
    
}
