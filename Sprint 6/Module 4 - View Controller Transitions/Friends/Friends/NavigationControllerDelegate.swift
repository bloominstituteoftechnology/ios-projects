//
//  NavigationControllerDelegate.swift
//  Friends
//
//  Created by Nikita Thomas on 11/15/18.
//  Copyright © 2018 Nikita Thomas. All rights reserved.
//

import UIKit

class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
    
    var sourceCell: TableViewCell!
    let animator = ImageTransitionAnimator()
    
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let toVC = toVC as? ViewController else { return nil }
        
        toVC.loadViewIfNeeded()
        
        animator.sourceName = sourceCell.nameLabel
        animator.sourcePhoto = sourceCell.friendImage

        animator.destName = toVC.nameLabel
        animator.destPhoto = toVC.imageView
        
        return animator
    }
}
