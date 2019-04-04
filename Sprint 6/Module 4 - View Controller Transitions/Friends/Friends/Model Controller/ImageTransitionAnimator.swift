//
//  Animator.swift
//  Friends
//
//  Created by Moses Robinson on 1/31/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

import UIKit

class ImageTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let toVC = transitionContext.viewController(forKey: .to) as? FriendDetailViewController,
            let toView = transitionContext.view(forKey: .to) else { return }
        
        let containerView = transitionContext.containerView
        
        let toViewEndFrame = transitionContext.finalFrame(for: toVC)
        
        containerView.addSubview(toView)
        toView.frame = toViewEndFrame
        toView.alpha = 0
        
        sourceName.alpha = 0
        sourcePhoto.alpha = 0
        destinationName.alpha = 0
        destinationPhoto.alpha = 0
        
        // Name Label Set Up
        let transitionNameInitialFrame = containerView.convert(sourceName.bounds, from: sourceName)
        let transitioningName = UILabel(frame: transitionNameInitialFrame)
        
        transitioningName.text = sourceName.text
        transitioningName.font = sourceName.font
        
        containerView.addSubview(transitioningName)
        
        // Photo imageView Set Up
        let transitionPhotoInitialFrame = containerView.convert(sourcePhoto.bounds, from: sourcePhoto)
        let transitioningPhoto = UIImageView(frame: transitionPhotoInitialFrame)
        
        transitioningPhoto.image = sourcePhoto.image
        transitioningPhoto.contentMode = destinationPhoto.contentMode
        
        containerView.addSubview(transitioningPhoto)
        
        let transitionDuration = self.transitionDuration(using: transitionContext)
        
        toView.layoutIfNeeded()
        
        UIView.animate(withDuration: transitionDuration, animations: {
            
            let transitioningNameEndFrame = containerView.convert(self.destinationName.bounds, from: self.destinationName)
            transitioningName.frame = transitioningNameEndFrame
            let transitioningPhotoEndFrame = containerView.convert(self.destinationPhoto.bounds, from: self.destinationPhoto)
            transitioningPhoto.frame = transitioningPhotoEndFrame
            
            toView.alpha = 1
            
        }) { (_) in
            
            self.sourceName.alpha = 1
            self.sourcePhoto.alpha = 1
            self.destinationName.alpha = 1
            self.destinationPhoto.alpha = 1
            
            transitioningName.removeFromSuperview()
            transitioningPhoto.removeFromSuperview()
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
        
    }
    
    // MARK: - Properties
    
    var sourceName: UILabel!
    var destinationName: UILabel!
    
    var sourcePhoto: UIImageView!
    var destinationPhoto: UIImageView!
}
