//
//  NavigationControllerDelegate.swift
//  Friends
//
//  Created by Moin Uddin on 10/4/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import UIKit

class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
    
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        guard let toVC = toVC as? FriendDetailViewController else { return nil }
        
        toVC.loadViewIfNeeded()
        
        animator.sourceFriendImageView = sourceCell.friendImageView
        animator.sourceFriendNameLabel = sourceCell.friendNameLabel
        animator.destinationFriendImageView = toVC.friendImageView
        animator.destinationFriendNameLabel = toVC.friendNameLabel
        
        return animator
    }
    
    let animator = ImageTransitionAnimator()
    var sourceCell:  FriendTableViewCell!
    
}
