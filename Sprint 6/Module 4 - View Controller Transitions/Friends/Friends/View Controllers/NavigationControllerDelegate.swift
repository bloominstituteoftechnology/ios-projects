//
//  NavigationControllerDelegate.swift
//  Friends
//
//  Created by Ivan Caldwell on 1/17/19.
//  Copyright © 2019 Ivan Caldwell. All rights reserved.
//

import Foundation
import UIKit

class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate, UIViewControllerTransitioningDelegate {
    var sourceCell: TableViewCell?
    var animator = ImageTransitionAnimator()
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return animator
    }
}
