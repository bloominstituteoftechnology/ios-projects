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
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
    }
}
