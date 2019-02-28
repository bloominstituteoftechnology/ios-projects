//
//  ImageTransitionAnimator.swift
//  Friends
//
//  Created by De MicheliStefano on 30.08.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

import UIKit

class ImageTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    var friendCell: FriendCellTableViewCell?
    var sourceImageView: UIImageView?
    var isBackAnimation: Bool = false
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let friendCell = friendCell, let nameLabel = friendCell.name, let imageView = friendCell.profileImage else { return }
        
        var sourceNameLabel = nameLabel
        var sourceImageView = imageView
        let destNameLabel: UILabel
        let destImageView: UIImageView
        var toView: UIView
        let toViewEndFrame: CGRect
        
        if isBackAnimation {
            guard let fromFriendsDetailVC = transitionContext.viewController(forKey: .from) as? FriendDetailViewController,
                let toFriendTVC = transitionContext.viewController(forKey: .to) as? FriendsTableViewController,
                let toFriendTVCView = transitionContext.view(forKey: .to) else { return }
            
            toFriendTVC.selectedFriendCell = friendCell
            
            sourceNameLabel = fromFriendsDetailVC.name
            sourceImageView = fromFriendsDetailVC.profileImage
            destNameLabel = friendCell.name
            destImageView = friendCell.profileImage
            toView = toFriendTVCView
            toViewEndFrame = transitionContext.finalFrame(for: toFriendTVC)
            
        } else {
            guard let toFriendsDetailVC = transitionContext.viewController(forKey: .to) as? FriendDetailViewController,
                let toFriendsDetailView = transitionContext.view(forKey: .to) else { return }
            
            toFriendsDetailVC.selectedFriendCell = friendCell
            destNameLabel = toFriendsDetailVC.name
            destImageView = toFriendsDetailVC.profileImage
            toView = toFriendsDetailView
            toViewEndFrame = transitionContext.finalFrame(for: toFriendsDetailVC)
        }
//
//        destName.text = sourceName.text
//        destImage.image = sourceImage.image
//        //destDescription.text = sourceDescription!
        
        // Setup the containerView which acts as the superview during the transition from presenting to presented VC
        let containerView = transitionContext.containerView
        
        // Set the end frame but set its initial alpha to 0.0 so its initially faded out
        toView.frame = toViewEndFrame
        toView.alpha = 0.0
        containerView.addSubview(toView)
        
        // Fade out the presenting and presented VC's labels for the transition
        sourceNameLabel.alpha = 0.0
        sourceImageView.alpha = 0.0
        destNameLabel.alpha = 0.0
        destImageView.alpha = 0.0
        
        // Create the name scratch that is used for the animated transition and add it to the containerView
        let nameInitialFrame = containerView.convert(sourceNameLabel.bounds, from: sourceNameLabel)
        let animatedNameLabel = UILabel(frame: nameInitialFrame)
        animatedNameLabel.text = sourceNameLabel.text
        animatedNameLabel.font = sourceNameLabel.font
        containerView.addSubview(animatedNameLabel)
        
        
        // Create the image scratch that is used for the animated transition and add it to the containerView
        let imageInitialFrame = containerView.convert(sourceImageView.bounds, from: sourceImageView)
        let animatedImage = UIImageView(frame: imageInitialFrame)
        animatedImage.image = sourceImageView.image
        containerView.addSubview(animatedImage)
        
        let duration = transitionDuration(using: transitionContext)
        
        // Force lay out of subviews
        toView.layoutIfNeeded()
        
        UIView.animate(withDuration: duration, animations: {
            animatedNameLabel.frame = containerView.convert(destNameLabel.bounds, from: destNameLabel)
            animatedImage.frame = containerView.convert(destImageView.bounds, from: destImageView)
            
            toView.alpha = 1.0
        }) { (success) in
            sourceNameLabel.alpha = 1.0
            sourceImageView.alpha = 1.0
            destNameLabel.alpha = 1.0
            destImageView.alpha = 1.0
            
            animatedNameLabel.removeFromSuperview()
            animatedImage.removeFromSuperview()
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
        
    }
    
}
