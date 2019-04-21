//
//  NavigationControllerDelegate.swift
//  Friends Animation
//
//  Created by Iyin Raphael on 10/4/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit

class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
    }
    
    var sourceCell: UITableViewCell 
}
