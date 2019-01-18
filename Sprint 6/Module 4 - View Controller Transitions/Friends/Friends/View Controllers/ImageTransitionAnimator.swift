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
        return 2.0
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
        //let sourceTitle = fromTVC.titleLabel!
        let sourceImage = fromTVC.imageView!
        sourceName.alpha = 0.5
        //sourceTitle.alpha = 0.5
        sourceImage.alpha = 0.5
        
        
        let destinationName = toVC.friendName!
        //let destinationTitle = toVC.friendTitle!
        let destinationImage = toVC.friendImage!
        destinationName.alpha = 0.0
        //destinationTitle.alpha = 0.0
        destinationImage.alpha = 0.0
        
        let nameInitialFrame = containerView.convert((sourceName.bounds), from: sourceName)
        //let titleInitialFrame = containerView.convert((sourceTitle.bounds), from: sourceTitle)
        let imageInitialFrame = containerView.convert((sourceImage.bounds), from: sourceImage)
        
        let animatedName = UILabel(frame: nameInitialFrame)
        //let animatedTitle = UILabel(frame: titleInitialFrame)
        let animatedImage = UIImageView(frame: imageInitialFrame)
        
        animatedName.text = sourceName.text
        animatedName.font = sourceName.font
        //animatedTitle.text = sourceTitle.text
        //animatedTitle.font = sourceTitle.font
        animatedImage.image = sourceImage.image
        animatedImage.contentMode = .scaleAspectFill
        
        containerView.addSubview(animatedName)
        //containerView.addSubview(animatedTitle)
        containerView.addSubview(animatedImage)
        
        let duration = transitionDuration(using: transitionContext)
        toView.layoutIfNeeded()
        UIView.animate(withDuration: duration, animations: {
            animatedName.frame = containerView.convert((destinationName.bounds), from: destinationName)
            //animatedTitle.frame = containerView.convert((destinationTitle.bounds), from: destinationTitle)
            //animatedImage.frame = containerView.convert(destinationImage.bounds, from: destinationImage)
            toView.alpha = 1.0
        }) { (success) in
            
            sourceName.alpha = 1.0
            //sourceTitle.alpha = 1.0
            sourceImage.alpha = 1.0
            
            animatedName.alpha = 0.0
            //animatedTitle.alpha = 0.0
            animatedImage.alpha = 0.0
            
            destinationName.alpha = 0.0
            //destinationTitle.alpha = 0.0
            destinationImage.alpha = 0.0
            
            animatedName.removeFromSuperview()
            //animatedTitle.removeFromSuperview()
            animatedImage.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }

}
