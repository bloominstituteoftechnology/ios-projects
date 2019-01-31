//
//  Animator.swift
//  Friends
//
//  Created by Moses Robinson on 1/31/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

import UIKit

class ImageTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        <#code#>
    }
    
    // MARK: - Properties
    
    var sourcePhoto: UIImageView!
    var destinationPhoto: UIImageView!
    
    var sourceName: UILabel!
    var destinationName: UILabel!
}
