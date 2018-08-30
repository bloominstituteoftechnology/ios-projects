//
//  ImageTransitionAnimator.swift
//  Friends
//
//  Created by Lisa Sampson on 8/30/18.
//  Copyright © 2018 Lisa Sampson. All rights reserved.
//

import UIKit

class ImageTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromVC = transitionContext.viewController(forKey: .from) as? FriendsTableViewController,
            let toVC = transitionContext.viewController(forKey: .to) as? DetailViewController,
            let toView = transitionContext.view(forKey: .to) else { return }
        
        let containerView = transitionContext.containerView
        
        guard let indexPath = fromVC.tableView.indexPathForSelectedRow,
            let cell = fromVC.tableView.cellForRow(at: indexPath) as? FriendsTableViewCell else { return }
        
        let sourceLabel = cell.nameLabel
        let sourceImage = cell.cellImageView
        let destinationLabel = toVC.nameLabel
        let destinationImage = toVC.imageView
        
        let startLabelFrame = transitionContext.initialFrame(for: fromVC)
        containerView.addSubview(toView)
        
    }
    
}
