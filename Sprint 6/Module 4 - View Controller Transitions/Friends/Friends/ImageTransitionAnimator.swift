//
//  ImageTransitionAnimator.swift
//  Friends
//
//  Created by Sergey Osipyan on 1/10/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

import UIKit

class ImageTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    var switchBool = true
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if switchBool {
            switchBool = false
        guard let fromTVC = transitionContext.viewController(forKey: .from) as? TableViewController,
        let toDVC = transitionContext.viewController(forKey: .to) as? DetailViewController,
            let toView = transitionContext.view(forKey: .to) else { return }
        let containerView = transitionContext.containerView
        
        let toViewEndFrame = transitionContext.finalFrame(for: toDVC)
        containerView.addSubview(toView)
        toView.frame = toViewEndFrame
        toView.alpha = 0.0
        let sourceImage = fromTVC.friendLargeImage!
        let sourceLabel = fromTVC.friendNameLabel!
        sourceLabel.alpha = 0.0
        sourceImage.alpha = 0.0
       
        let destinationLabel = toDVC.frieandName!
        let destinationImage = toDVC.friendImage!
      
        destinationImage.alpha = 0.0
        destinationLabel.alpha = 0.0
        
        let labelInitialFrame = containerView.convert((sourceLabel.bounds), to: sourceLabel)
        let animatedLabel = UILabel(frame: labelInitialFrame)
        animatedLabel.text = sourceLabel.text
        animatedLabel.font = sourceLabel.font
        containerView.addSubview(animatedLabel)
        
        let ImageInitialFrame = containerView.convert((sourceImage.bounds), to: sourceLabel)
        let animatedImage = UIImageView(frame: ImageInitialFrame)
        animatedImage.image = sourceImage.image
        animatedImage.contentMode = .scaleAspectFill
        containerView.addSubview(animatedImage)
     
        let duration = transitionDuration(using: transitionContext)
        toView.layoutIfNeeded()
        UIView.animate(withDuration: duration, animations: {
            animatedLabel.frame = containerView.convert((destinationLabel.bounds), from: destinationLabel)
            animatedImage.frame = containerView.convert(destinationImage.bounds, from: destinationImage)
            toView.alpha = 1.0
        }) { (success) in
            
            sourceLabel.alpha = 1.0
            destinationLabel.alpha = 1.0
            animatedLabel.alpha = 0.0
            
            sourceImage.alpha = 1.0
            destinationImage.alpha = 1.0
            animatedImage.alpha = 0.0
            
            animatedImage.removeFromSuperview()
            animatedLabel.removeFromSuperview()
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
        } else {
            switchBool = true
            
            guard let fromTVC = transitionContext.viewController(forKey: .from) as? DetailViewController,
                let toDVC = transitionContext.viewController(forKey: .to) as? TableViewController,
                let toView = transitionContext.view(forKey: .to) else { return }
            let containerView = transitionContext.containerView
            
            let toViewEndFrame = transitionContext.finalFrame(for: toDVC)
            containerView.addSubview(toView)
            toView.frame = toViewEndFrame
            toView.alpha = 0.0
            let sourceImage = fromTVC.friendImage!
            let sourceLabel = fromTVC.frieandName!
            sourceLabel.alpha = 0.0
            sourceImage.alpha = 0.0
            
            let destinationLabel = toDVC.friendNameLabel!
            let destinationImage = toDVC.friendLargeImage!
            
            destinationImage.alpha = 0.0
            destinationLabel.alpha = 0.0
            
            let labelInitialFrame = containerView.convert((sourceLabel.bounds), to: sourceLabel)
            let animatedLabel = UILabel(frame: labelInitialFrame)
            animatedLabel.text = sourceLabel.text
            animatedLabel.font = sourceLabel.font
            containerView.addSubview(animatedLabel)
            
            let ImageInitialFrame = containerView.convert((sourceImage.bounds), to: sourceLabel)
            let animatedImage = UIImageView(frame: ImageInitialFrame)
            animatedImage.image = sourceImage.image
            animatedImage.contentMode = .scaleAspectFill
            containerView.addSubview(animatedImage)
            
            let duration = transitionDuration(using: transitionContext)
            toView.layoutIfNeeded()
            UIView.animate(withDuration: duration, animations: {
                animatedLabel.frame = containerView.convert((destinationLabel.bounds), from: destinationLabel)
                animatedImage.frame = containerView.convert(destinationImage.bounds, from: destinationImage)
                toView.alpha = 1.0
            }) { (success) in
                
                sourceLabel.alpha = 1.0
                destinationLabel.alpha = 1.0
                animatedLabel.alpha = 0.0
                
                sourceImage.alpha = 1.0
                destinationImage.alpha = 1.0
                animatedImage.alpha = 0.0
                
                animatedImage.removeFromSuperview()
                animatedLabel.removeFromSuperview()
                
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            
        }
    }
    
}
}
