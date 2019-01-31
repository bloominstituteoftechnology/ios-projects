//
//  Animator.swift
//  Friends
//
//  Created by Jocelyn Stuart on 1/31/19.
//  Copyright © 2019 JS. All rights reserved.
//

import UIKit

typealias ContentProvidingVC = ContentProviding & UIViewController
typealias ContentProvidingTC = ContentProviding & UITableViewController

class Animator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // What do you want the transition to look like?
        
        guard let fromTC = transitionContext.viewController(forKey: .from) as? ContentProvidingTC, let toVC = transitionContext.viewController(forKey: .to) as? ContentProvidingVC,
            let toView = transitionContext.view(forKey: .to) else { return } // this is the final look of the view controller we are going to
        
        // This is the view that holds the label that will be moved from one position to the other
        
        let containerView = transitionContext.containerView
        
        let toViewEndFrame = transitionContext.finalFrame(for: toVC)
        
        containerView.addSubview(toView)
        toView.frame = toViewEndFrame
        toView.alpha = 0 // Hide the view copy
        
        // Figure out where the label should start and where it should end up
        
        let fromLabel = fromTC.nameLabel!
        let toLabel = toVC.nameLabel!
        
        let fromPic = fromTC.profileImage!
        let toPic = toVC.profileImage!
        
        // Hide both REAL labels so they do not show up during the transition
        toLabel.alpha = 0
        fromLabel.alpha = 0
        
        fromPic.alpha = 0
        toPic.alpha = 0
        
        let transitionLabelInitialFrame = containerView.convert(fromLabel.bounds, from: fromLabel)
        let transitionPicInitialFrame = containerView.convert(fromPic.bounds, from: fromPic)
        
        // The transitioning label will be in exactly the same initial location as the fromLabel.
        let transitioningLabel = UILabel(frame: transitionLabelInitialFrame)
        let transitioningPic = UIImageView(frame: transitionPicInitialFrame)
        
        // Match the look of the text in the transitioning label to the text of the REAL labels.
        
        transitioningLabel.font = fromLabel.font
        transitioningLabel.text = fromLabel.text
        
        containerView.addSubview(transitioningPic)
        
        containerView.addSubview(transitioningLabel)
        
        // Perform an animation to move the transitioningLabel from its original position to the toLabel's position.
        
        let transitionDuration = self.transitionDuration(using: transitionContext)
        
        toView.layoutIfNeeded()
        
        UIView.animate(withDuration: transitionDuration, animations: {
            
            // This is where the position of the toLabel
            let transitioningLabelEndFrame = containerView.convert(toLabel.bounds, from: toLabel)
            transitioningLabel.frame = transitioningLabelEndFrame
            
            let transitioningPicEndFrame = containerView.convert(toLabel.bounds, from: toLabel)
            transitioningPic.frame = transitioningPicEndFrame
            
            toView.alpha = 1
            
            
        }) { (_) in
            
            // Reset the views to their original state
            toLabel.alpha = 1
            fromLabel.alpha = 1
            
            toPic.alpha = 1
            fromPic.alpha = 1
            
            transitioningPic.removeFromSuperview()
            
            transitioningLabel.removeFromSuperview()
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            
        }
    }
    
    
    /*var nameLabel: UILabel!
    var profileImage: UIImage!*/
    
    
}
