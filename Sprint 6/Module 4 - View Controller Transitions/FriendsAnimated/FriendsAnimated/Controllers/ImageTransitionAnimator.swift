//
//  ImageTransitionAnimator.swift
//  FriendsAnimated
//
//  Created by Angel Buenrostro on 1/31/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

import UIKit

class ImageTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // Main animation function
        
        guard let sourceVC = transitionContext.viewController(forKey: .from),
            let destinationVC = transitionContext.viewController(forKey: .to),
            let finalView = transitionContext.view(forKey: .to)
            else { return }
        
        let transportingView = transitionContext.containerView
        
        let finalViewEndFrame = transitionContext.finalFrame(for: destinationVC)
        
        transportingView.addSubview(finalView)
        finalView.frame = finalViewEndFrame
        finalView.alpha = 0
        
        //let sourceLabel = cell?.textLabel?.text
        
        
        
        
    }
    
    
}
