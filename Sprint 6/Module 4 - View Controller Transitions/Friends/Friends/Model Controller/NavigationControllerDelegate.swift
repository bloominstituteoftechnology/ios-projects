//
//  NavigationControllerDelegate.swift
//  Friends
//
//  Created by Moses Robinson on 1/31/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

import UIKit

class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        guard let toVC = toVC as? FriendDetailViewController else { return nil }
        
        // loads the view beforehand.
        toVC.loadViewIfNeeded()
        
        animator.sourceName = sourceCell.textLabel
        animator.sourcePhoto = sourceCell.imageView
        
        animator.destinationName = toVC.friendName
        animator.destinationPhoto = toVC.friendImage
        
        return animator
    }
    
    
    // MARK: - Properties
    
    var sourceCell: UITableViewCell!
    
    let animator = ImageTransitionAnimator()
}
