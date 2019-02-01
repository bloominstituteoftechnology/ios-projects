//
//  NavigationControllerDelegate.swift
//  FriendsAnimated
//
//  Created by Angel Buenrostro on 1/31/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

import UIKit

class NavigationControllerDelegate: NSObject, UIViewControllerAnimatedTransitioning {
    
    var sourceCell : FriendsTableViewCell?
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        // have to implement
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // have to implement
    }
    
    
}
