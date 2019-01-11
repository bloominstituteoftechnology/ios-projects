//
//  NavigationControllerDelegate.swift
//  FriendsTransitions
//
//  Created by Benjamin Hakes on 1/10/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

import Foundation
import UIKit

class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
    
    let animator = ImageTransitionAnimator()
    var sourceCell: UITableViewCell?
    var interactionController: UIPercentDrivenInteractiveTransition?
    
    func navigationController(
        _ navigationController: UINavigationController,
        animationControllerFor operation: UINavigationController.Operation,
        from fromVC: UIViewController,
        to toVC: UIViewController
        ) -> UIViewControllerAnimatedTransitioning? {
        
        switch operation {
        case .push:
            if let toVC = toVC as? FriendsDetailViewController{
                animator.sourcePhoto = sourceCell?.imageView
                animator.sourceNameLabel = sourceCell?.textLabel
                
                animator.destintationPhoto = toVC.headshotImageView
                animator.destinationNameLabel = toVC.nameLabel
                animator.push = true
            }
            return animator
            
        case .pop:
            if let fromVC = fromVC as? FriendsDetailViewController {
                animator.destintationPhoto = sourceCell?.imageView
                animator.destinationNameLabel = sourceCell?.textLabel
                
                animator.sourcePhoto = fromVC.headshotImageView
                animator.sourceNameLabel = fromVC.nameLabel
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
