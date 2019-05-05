//
//  ImageTransitionAnimator.swift
//  Friends
//
//  Created by Moin Uddin on 10/4/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import UIKit

class ImageTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from) as? FriendsTableViewController,
            let toVC = transitionContext.viewController(forKey: .to) as? FriendDetailViewController,
            let toView = transitionContext.view(forKey: .to) else { return }
        let containerView = transitionContext.containerView
        let toViewEndFrame = transitionContext.finalFrame(for: toVC)
        containerView.addSubview(toView)
        
        toView.frame = toViewEndFrame
        toView.alpha  = 0
        
        let friendNameLabelInitialFrame = containerView.convert(sourceFriendNameLabel.bounds, from: sourceFriendNameLabel)
        let friendImageViewInitialFrame = containerView.convert(sourceFriendImageView.bounds, from: sourceFriendImageView)
        let animatedfriendLabel = UILabel(frame: friendNameLabelInitialFrame)
        let animatedImageView = UIImageView(frame: friendImageViewInitialFrame)
        animatedfriendLabel.text = sourceFriendNameLabel.text
        animatedImageView.image = sourceFriendImageView.image
        containerView.addSubview(animatedImageView)
        containerView.addSubview(animatedfriendLabel)
        
        
        //Set alphas to zero
        sourceFriendNameLabel.alpha = 0
        destinationFriendNameLabel.alpha = 0
        sourceFriendImageView.alpha = 0
        destinationFriendImageView.alpha = 0
        
        let duration = transitionDuration(using: transitionContext)
        toView.layoutIfNeeded()
        
        UIView.animate(withDuration: duration, animations: {
            let labelEndFrame = containerView.convert(animatedfriendLabel.bounds, from: self.destinationFriendNameLabel)
            animatedfriendLabel.frame = labelEndFrame
            
            let imageEndFrame = containerView.convert(animatedImageView.bounds, from: self.destinationFriendImageView)
            animatedImageView.frame = imageEndFrame
            
            toView.alpha = 1
            
        }) { (success) in
            
            //Set the Alphas back to 1
            self.sourceFriendNameLabel.alpha = 1
            self.destinationFriendNameLabel.alpha = 1
            self.sourceFriendImageView.alpha = 1
            self.destinationFriendImageView.alpha = 1
            
            //Removes the Table View Cell Transition from View
            // If this isn't implemented the Table View Cell with
            //The image and name will just stay there on the
            // Detail View Sreen
            animatedfriendLabel.removeFromSuperview()
            animatedImageView.removeFromSuperview()
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    
    var sourceFriendImageView: UIImageView!
    var sourceFriendNameLabel: UILabel!
    var destinationFriendImageView: UIImageView!
    var destinationFriendNameLabel: UILabel!
    
}
