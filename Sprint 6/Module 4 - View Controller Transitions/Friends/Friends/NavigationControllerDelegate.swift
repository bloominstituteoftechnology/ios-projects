//
//  NavigationControllerDelegate.swift
//  Friends
//
//  Created by Daniela Parra on 10/4/18.
//  Copyright © 2018 Daniela Parra. All rights reserved.
//

import UIKit

class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate {

    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if let toVC = toVC as? FriendDetailViewController {
            
            animator.fromImageView = sourceCell?.imageView
            animator.fromNameLabel = sourceCell?.textLabel
        
            animator.toImageView = toVC.friendImageView
            animator.toNameLabel = toVC.nameLabel
        }
        
        if let fromVC = fromVC as? FriendDetailViewController {
            animator.fromImageView = fromVC.friendImageView
            animator.fromNameLabel = fromVC.nameLabel
            
            animator.toImageView = sourceCell?.imageView
            animator.toNameLabel = sourceCell?.textLabel
        }
        return animator
    }
    
    let animator = ImageTransitionAnimator()
    var sourceCell: UITableViewCell?

}
