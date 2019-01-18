//
//  ImageTransitionAnimator.swift
//  Friends
//
//  Created by Ivan Caldwell on 1/17/19.
//  Copyright © 2019 Ivan Caldwell. All rights reserved.
//

import Foundation
import UIKit

class ImageTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromTVC = transitionContext.viewController(forKey: .from) as? TableViewController,
            let toVC = transitionContext.viewController(forKey: .to) as? ViewController,
            let toView = transitionContext.view(forKey: .to) else {
                return
        }
        
        let containerView = transitionContext.containerView
        containerView.addSubview(toView)

        let toViewEndFrame = transitionContext.finalFrame(for: toVC)
        toView.frame = toViewEndFrame
        toView.alpha = 0.5
        // ^^^^^^^^^^^^^ The destination view is immediately on screen
        // so we set the alpha to zero, so the user can't see it...
        
        
        let sourceName = fromTVC.nameLabel!
        let sourceTitle = fromTVC.titleLabel!
        let sourceImage = fromTVC.imageView!
        
        sourceName.alpha = 0.5
        sourceTitle.alpha = 0.5
        sourceImage.alpha = 0.5
        
        
    }

}
