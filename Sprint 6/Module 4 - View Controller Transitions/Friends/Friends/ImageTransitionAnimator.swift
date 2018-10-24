//
//  ImageTransitionAnimator.swift
//  Friends
//
//  Created by Daniela Parra on 10/4/18.
//  Copyright © 2018 Daniela Parra. All rights reserved.
//

import UIKit

class ImageTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1 //or 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
       
        guard let fromImageView = fromImageView,
            let fromNameLabel = fromNameLabel,
            var toImageView = toImageView,
            var toNameLabel = toNameLabel,
            let toView = transitionContext.view(forKey: .to) else { return }
        
        var toViewEndFrame: CGRect
        
        if let toVC = transitionContext.viewController(forKey: .to) as? FriendDetailViewController {
            toViewEndFrame = transitionContext.finalFrame(for: toVC)
            toNameLabel = toVC.nameLabel
            toImageView = toVC.friendImageView
            toView.frame = toViewEndFrame
            
        } else if let toVC = transitionContext.viewController(forKey: .to) as? FriendsTableViewController {
            toViewEndFrame = transitionContext.finalFrame(for: toVC)
            toView.frame = toViewEndFrame
        }
        
        let containerView = transitionContext.containerView
        containerView.addSubview(toView)
        toView.alpha = 0
        
        
        //Hide from label and image view
        fromNameLabel.alpha = 0
        fromImageView.alpha = 0
        toNameLabel.alpha = 0
        toImageView.alpha = 0
        
        let labelInitialFrame = containerView.convert(fromNameLabel.bounds, from: fromNameLabel)
        let imageViewInitialFrame = containerView.convert(fromImageView.bounds, from: fromImageView)
        
        let animatedLabel = UILabel(frame: labelInitialFrame)
        animatedLabel.text = fromNameLabel.text
        animatedLabel.font = fromNameLabel.font
        containerView.addSubview(animatedLabel)
        
        let animatedImageView = UIImageView(frame: imageViewInitialFrame)
        animatedImageView.image = fromImageView.image
        animatedImageView.contentMode = .scaleAspectFit
        containerView.addSubview(animatedImageView)
        
        let duration = transitionDuration(using: transitionContext)
        
        toView.layoutIfNeeded()
        
        UIView.animate(withDuration: duration, animations: {
            let labelEndFrame = containerView.convert(toNameLabel.bounds, from: toNameLabel)
            let imageViewEndFrame = containerView.convert(toImageView.bounds, from: toImageView)
            
            animatedLabel.frame = labelEndFrame
            animatedLabel.font = toNameLabel.font
            
            animatedImageView.frame = imageViewEndFrame
        
            toView.alpha = 1
            
        }) { (_) in
            toNameLabel.alpha = 1
            toImageView.alpha = 1
            fromNameLabel.alpha = 1
            fromImageView.alpha = 1
            
            animatedLabel.removeFromSuperview()
            animatedImageView.removeFromSuperview()
        
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    
    var fromImageView: UIImageView?
    var toImageView: UIImageView?
    var fromNameLabel: UILabel?
    var toNameLabel: UILabel?
    
    
}
