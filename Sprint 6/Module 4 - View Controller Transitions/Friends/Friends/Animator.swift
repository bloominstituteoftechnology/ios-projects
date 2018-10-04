//
//  Animator.swift
//  Friends
//
//  Created by Dillon McElhinney on 10/4/18.
//  Copyright © 2018 Dillon McElhinney. All rights reserved.
//

import UIKit

class ImageTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    var fromImageView: UIImageView?
    var toImageView: UIImageView?
    var fromNameLabel: UILabel?
    var toNameLabel: UILabel?
    var push = false
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.8
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromImageView = fromImageView,
            let fromNameLabel = fromNameLabel,
            let toView = transitionContext.view(forKey: .to),
            let toVC = transitionContext.viewController(forKey: .to) else { return }
        let containerView = transitionContext.containerView
        
        if push {
            guard let detailVC = transitionContext.viewController(forKey: .to) as? FriendDetailViewController else { return }
            toImageView = detailVC.friendImageView
            toNameLabel = detailVC.nameLabel
        }
        
        let viewEndFrame = transitionContext.finalFrame(for: toVC)
        containerView.addSubview(toView)
        toView.frame = viewEndFrame
        toView.alpha = 0.0
        
        let imageViewStartFrame = containerView.convert(fromImageView.bounds, from: fromImageView)
        let nameLabelStartFrame = containerView.convert(fromNameLabel.bounds, from: fromNameLabel)
        
        let imageView = UIImageView(frame: imageViewStartFrame)
        imageView.image = fromImageView.image
        
        let label = UILabel(frame: nameLabelStartFrame)
        label.text = fromNameLabel.text
        label.font = fromNameLabel.font
        
        containerView.addSubview(imageView)
        containerView.addSubview(label)
        
        fromNameLabel.alpha = 0.0
        fromImageView.alpha = 0.0
        toNameLabel!.alpha = 0.0
        toImageView!.alpha = 0.0
        
        let duration = transitionDuration(using: transitionContext)
        
        toView.layoutIfNeeded()
        UIView.animate(withDuration: duration, animations: {
            let imageViewEndFrame = containerView.convert(self.toImageView!.bounds, from: self.toImageView!)
            let nameLabelEndFrame = containerView.convert(self.toNameLabel!.bounds, from: self.toNameLabel!)
            
            imageView.frame = imageViewEndFrame
            imageView.contentMode = self.toImageView!.contentMode
            label.frame = nameLabelEndFrame
            
            toView.alpha = 1.0
            
        }) { (_) in
            fromNameLabel.alpha = 1.0
            fromImageView.alpha = 1.0
            self.toNameLabel!.alpha = 1.0
            self.toImageView!.alpha = 1.0
            
            imageView.removeFromSuperview()
            label.removeFromSuperview()
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
