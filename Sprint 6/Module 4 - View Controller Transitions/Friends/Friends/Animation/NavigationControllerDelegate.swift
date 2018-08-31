//
//  NavigationControllerDelegate.swift
//  Friends
//
//  Created by Lisa Sampson on 8/30/18.
//  Copyright © 2018 Lisa Sampson. All rights reserved.
//

import UIKit


class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        guard let toVC = toVC as? DetailViewController else { return nil }
        
        toVC.loadViewIfNeeded()
        
        animator.sourceImageView = sourceCell.cellImageView
        animator.sourceNameLabel = sourceCell.nameLabel
        animator.destinationImageView = toVC.imageView
        animator.destinationNameLabel = toVC.nameLabel
        
        return animator
    }
    
    var sourceCell: FriendsTableViewCell!
    let animator = ImageTransitionAnimator()
    
}
