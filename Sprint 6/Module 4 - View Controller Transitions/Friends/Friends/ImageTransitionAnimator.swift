//
//  Animator.swift
//  Friends
//
//  Created by Nikita Thomas on 11/15/18.
//  Copyright © 2018 Nikita Thomas. All rights reserved.
//

import UIKit

class ImageTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    var sourcePhoto: UIImageView!
    var destPhoto: UIImageView!
    
    var sourceName: UILabel!
    var destName: UILabel!
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toVC = transitionContext.viewController(forKey: .to) as? ViewController,
            let toView = transitionContext.view(forKey: .to) else { return }
        
        let containerView = transitionContext.containerView
        
        let toViewEndFrame = transitionContext.finalFrame(for: toVC)
        containerView.addSubview(toView)
        toView.frame = toViewEndFrame
        toView.alpha = 0
        
        sourceName.alpha = 0
        sourcePhoto.alpha = 0
        destPhoto.alpha = 0
        destName.alpha = 0
        
        let labelInitialFrame = containerView.convert(sourceName.bounds, from: sourceName)
        let animatedNameLabel = UILabel(frame: labelInitialFrame)
        animatedNameLabel.text = sourceName.text
        animatedNameLabel.font = sourceName.font
        destName.font = sourceName.font
        containerView.addSubview(animatedNameLabel)
        
        let imageInitialFrame = containerView.convert(sourcePhoto.bounds, from: sourcePhoto)
        let animatedImageView = UIImageView(frame: imageInitialFrame)
        animatedImageView.contentMode = sourcePhoto.contentMode
        animatedImageView.image = sourcePhoto.image
        containerView.addSubview(animatedImageView)
        
        let duration = transitionDuration(using: transitionContext)
        toView.layoutIfNeeded()
        
        UIView.animate(withDuration: duration, animations: {
            animatedNameLabel.frame = containerView.convert(self.destName.bounds, from: self.destName)
            animatedImageView.frame = containerView.convert(self.destPhoto.bounds, from: self.destPhoto)
            toView.alpha = 1
        }) { (success) in
            
            self.sourceName.alpha = 1
            self.sourcePhoto.alpha = 1
            self.destName.alpha = 1
            self.destPhoto.alpha = 1
            animatedNameLabel.removeFromSuperview()
            animatedImageView.removeFromSuperview()
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
