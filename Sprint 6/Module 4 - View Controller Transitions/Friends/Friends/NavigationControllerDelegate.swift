import UIKit

class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
    
    var sourceCell: UITableViewCell?
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return animator
    }
    
    private let animator = Animator()
}
