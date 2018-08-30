//
//  NavigationControllerDelegate.swift
//  Friends
//
//  Created by De MicheliStefano on 30.08.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

import UIKit

class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
    
    var sourceCell: FriendCellTableViewCell?
    var animator = ImageTransitionAnimator()
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        guard let sourceCell = sourceCell,
            let toVC = toVC as? FriendDetailViewController else { return animator }
        animator.sourceNameLabel = sourceCell.name.text
        animator.sourceImage = sourceCell.profileImage.image
        animator.destNameLabel = toVC.name.text
        animator.destImage = toVC.profileImage.image
        
        return animator
    }
    
}
