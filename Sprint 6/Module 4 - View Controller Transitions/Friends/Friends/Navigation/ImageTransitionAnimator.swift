//
//  ImageTransitionAnimator.swift
//  Friends
//
//  Created by De MicheliStefano on 30.08.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

import UIKit

class ImageTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    var sourceNameLabel: UILabel?
    var sourceImageView: UIImageView?
    var sourceDescription: String?
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toVC = transitionContext.viewController(forKey: .to) as? FriendDetailViewController,
            let toView = transitionContext.view(forKey: .to) else { return }
        
        let containerView = transitionContext.containerView
        
        let toViewEndFrame = transitionContext.finalFrame(for: toVC)
        toView.frame = toViewEndFrame
        toView.alpha = 0.0
        containerView.addSubview(toView)
        
        let sourceName = sourceNameLabel!
        let sourceImage = sourceImageView!
        let destName = toVC.name!
        let destImage = toVC.profileImage!
        let destDescription = toVC.descript!
        destName.text = sourceName.text
        destImage.image = sourceImage.image
        destDescription.text = sourceDescription!
        
        sourceName.alpha = 0.0
        sourceImage.alpha = 0.0
        destName.alpha = 0.0
        destImage.alpha = 0.0
        
        let nameInitialFrame = containerView.convert(sourceName.bounds, from: sourceName)
        let animatedNameLabel = UILabel(frame: nameInitialFrame)
        animatedNameLabel.text = sourceName.text
        animatedNameLabel.font = sourceName.font
        containerView.addSubview(animatedNameLabel)
        
        let imageInitialFrame = containerView.convert(sourceImage.bounds, from: sourceImage)
        let animatedImage = UIImageView(frame: imageInitialFrame)
        animatedImage.image = sourceImage.image
        containerView.addSubview(animatedImage)
        
        let duration = transitionDuration(using: transitionContext)
        
        toView.layoutIfNeeded()
        
        UIView.animate(withDuration: duration, animations: {
            animatedNameLabel.frame = containerView.convert(destName.bounds, from: destName)
            animatedImage.frame = containerView.convert(destImage.bounds, from: destImage)
            
            toView.alpha = 1.0
        }) { (success) in
            sourceName.alpha = 1.0
            sourceImage.alpha = 1.0
            destName.alpha = 1.0
            destImage.alpha = 1.0
            
            animatedNameLabel.removeFromSuperview()
            animatedImage.removeFromSuperview()
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
        
    }
    
}
