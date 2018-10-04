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
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let toVC = toVC as? FriendDetailViewController
        
        animator.fromImageView = sourceCell?.imageView
        animator.fromNameLabel = sourceCell?.textLabel
        
        animator.toImageView = toVC?.friendImageView
        animator.toNameLabel = toVC?.nameLabel
        
        return animator
    }
}
