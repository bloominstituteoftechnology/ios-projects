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
        
        animator.sourceNameLabel = sourceCell?.name
        animator.sourceImageView = sourceCell?.profileImage
        animator.sourceDescription = sourceCell?.friend?.description
        
        return animator
    }
    
}
