//
//  IfIMessUp.swift
//  Friends
//
//  Created by Daniela Parra on 10/4/18.
//  Copyright © 2018 Daniela Parra. All rights reserved.
//

import Foundation

//guard let fromImageView = fromImageView,
//    let fromNameLabel = fromNameLabel,
//    let toVC = transitionContext.viewController(forKey: .to),
//    let toView = transitionContext.view(forKey: .to) else { return }
//
//let containerView = transitionContext.containerView
//let toViewEndFrame = transitionContext.finalFrame(for: toVC)
//containerView.addSubview(toView)
//toView.frame = toViewEndFrame
//toView.alpha = 0
//
//
//guard let toNameLabel = toVC.nameLabel,
//    let toImageView = toVC.friendImageView else { return }
//if let toVC = transitionContext.viewController(forKey: .to) as? FriendDetailViewController {
//toNameLabel = toVC.nameLabel
//toImageView = toVC.friendImageView
//} else if let fromVC = transitionContext.viewController(forKey: .to) as? FriendDetailViewController {
//    fromNameLabel = fromVC.nameLabel
//    fromImageView = fromVC.friendImageView
//}
//
////Hide from label and image view
//fromNameLabel.alpha = 0
//fromImageView.alpha = 0
//toNameLabel.alpha = 0
//toImageView.alpha = 0
//
//let labelInitialFrame = containerView.convert(fromNameLabel.bounds, from: fromNameLabel)
//let imageViewInitialFrame = containerView.convert(fromImageView.bounds, from: fromImageView)
//
//let animatedLabel = UILabel(frame: labelInitialFrame)
//animatedLabel.text = fromNameLabel.text
//animatedLabel.font = fromNameLabel.font
//containerView.addSubview(animatedLabel)
//
//let animatedImageView = UIImageView(frame: imageViewInitialFrame)
//animatedImageView.image = fromImageView.image
//animatedImageView.contentMode = .scaleAspectFit
//containerView.addSubview(animatedImageView)
//
//let duration = transitionDuration(using: transitionContext)
//
//toView.layoutIfNeeded()
//
//UIView.animate(withDuration: duration, animations: {
//    let labelEndFrame = containerView.convert(toNameLabel.bounds, from: toNameLabel)
//    let imageViewEndFrame = containerView.convert(toImageView.bounds, from: toImageView)
//    
//    animatedLabel.frame = labelEndFrame
//    animatedLabel.font = toNameLabel.font
//    
//    animatedImageView.frame = imageViewEndFrame
//    
//    toView.alpha = 1
//}) { (_) in
//    toNameLabel.alpha = 1
//    toImageView.alpha = 1
//    fromNameLabel.alpha = 1
//    fromImageView.alpha = 1
//    
//    animatedLabel.removeFromSuperview()
//    animatedImageView.removeFromSuperview()
//    
//    transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
//}
