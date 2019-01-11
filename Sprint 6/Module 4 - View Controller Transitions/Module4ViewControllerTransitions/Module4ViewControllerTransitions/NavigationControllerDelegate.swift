import Foundation
import UIKit

class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
    
    static let navDelegate = NavigationControllerDelegate()
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UITableViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return animator
    }
    let animator = Animator()
    var sourceCell: UITableViewCell?
}
