
import UIKit

class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
    
    // Property that allows the navigation controller delegate to get a reference to the table view cell that initiates the transition
    var sourceCell = UITableViewCell()
    
    // Keep a strong reference to the animator object
    let animator = ImageTransitionAnimator()
    
    weak private(set) var navigationController: UINavigationController?
    
    var detailViewController: DetailViewController!
    
    private func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning {
        
        
        
        // Configure the animator object by "filling the buckets" we gave the animator as placeholders for information
        animator.sourceImage = sourceCell.imageView!
        animator.sourceLabel = sourceCell.textLabel!
        
        animator.destinationImage = sourceCell.imageView!
        animator.destinationLabel = sourceCell.textLabel!
        
        return animator
        
        
    }
    


    
}
