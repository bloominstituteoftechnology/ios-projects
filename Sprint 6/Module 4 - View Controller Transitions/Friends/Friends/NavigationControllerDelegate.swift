//
//  NavigationControllerDelegate.swift
//  Friends
//
//  Created by Dillon McElhinney on 10/4/18.
//  Copyright © 2018 Dillon McElhinney. All rights reserved.
//

import UIKit

class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
    
    let animator = ImageTransitionAnimator()
    var sourceCell: UITableViewCell?
    var interactionController: UIPercentDrivenInteractiveTransition?
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        switch operation {
        case .push:
            if let toVC = toVC as? FriendDetailViewController {
                animator.fromImageView = sourceCell?.imageView
                animator.fromNameLabel = sourceCell?.textLabel
                
                animator.toImageView = toVC.friendImageView
                animator.toNameLabel = toVC.nameLabel
                animator.push = true
            }
            return animator
        case .pop:
            if let fromVC = fromVC as? FriendDetailViewController {
                animator.toImageView = sourceCell?.imageView
                animator.toNameLabel = sourceCell?.textLabel
                
                animator.fromImageView = fromVC.friendImageView
                animator.fromNameLabel = fromVC.nameLabel
                animator.push = false
            }
            return animator
        default:
            return nil
        }
        
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactionController
    }
    
}
