//
//  ImageTransitionAnimator.swift
//  FriendsTransitions
//
//  Created by Benjamin Hakes on 1/10/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

import Foundation
import UIKit

class ImageTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        <#code#>
    }
    
    var pictureImageView: UIImage
    var name: String
    
    
    
    
}
