//
//  ImageTransitionAnimator.swift
//  FriendsTransitions
//
//  Created by Benjamin Hakes on 1/10/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

import Foundation
import UIKit

class ImageTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.7
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard
            let sourcePhoto = sourcePhoto,
            let sourceNameLabel = sourceNameLabel,
            let toView = transitionContext.view(forKey: .to),
            let toVC = transitionContext.viewController(forKey: .to) else { return }
        
        let containerView = transitionContext.containerView
    
        if push {
            guard let detailVC = transitionContext.viewController(forKey: .to) as? FriendsDetailViewController else { return }
            destintationPhoto = detailVC.headshotImageView
            destinationNameLabel = detailVC.nameLabel
        }
        
        let viewEndFrame = transitionContext.finalFrame(for: toVC)
        containerView.addSubview(toView)
        toView.frame = viewEndFrame
        toView.alpha = 0.0
        
        let imageViewStartFrame = containerView.convert(sourcePhoto.bounds, from: sourcePhoto)
        let nameLabelStartFrame = containerView.convert(sourceNameLabel.bounds, from: sourceNameLabel)
        
        let imageView = UIImageView(frame: imageViewStartFrame)
        imageView.layer.cornerRadius = sourcePhoto.layer.cornerRadius
        imageView.layer.masksToBounds = true
        imageView.image = sourcePhoto.image
        
        let label = UILabel(frame: nameLabelStartFrame)
        label.text = sourceNameLabel.text
        label.font = sourceNameLabel.font
        
        containerView.addSubview(imageView)
        containerView.addSubview(label)
        
        sourceNameLabel.alpha = 0.0
        sourcePhoto.alpha = 0.0
        destinationNameLabel!.alpha = 0.0
        destintationPhoto?.alpha = 0.0
        
        let duration = transitionDuration(using: transitionContext)
        toView.layoutIfNeeded()
        
        UIView.animate(withDuration: duration, animations: {
            
            let imageViewEndFrame = containerView.convert(self.destintationPhoto!.bounds, from: self.destintationPhoto)
            let nameLabelEndFrame = containerView.convert(self.destinationNameLabel!.bounds, from: self.destinationNameLabel)
            
            imageView.frame = imageViewEndFrame
            imageView.contentMode = (self.destintationPhoto!.contentMode)
            imageView.layer.cornerRadius = self.destintationPhoto!.layer.cornerRadius
            label.frame = nameLabelEndFrame
            
            toView.alpha = 1.0
            
            }) { (success) in
                sourceNameLabel.alpha = 1.0
                sourcePhoto.alpha = 1.0
                self.destinationNameLabel!.alpha = 1.0
                self.destintationPhoto?.alpha = 1.0
                
                imageView.removeFromSuperview()
                label.removeFromSuperview()
                
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
        
    }
    
    var sourcePhoto: UIImageView?
    var destintationPhoto: UIImageView?
    var sourceNameLabel: UILabel?
    var destinationNameLabel: UILabel?
    var push = false
    
    
}
