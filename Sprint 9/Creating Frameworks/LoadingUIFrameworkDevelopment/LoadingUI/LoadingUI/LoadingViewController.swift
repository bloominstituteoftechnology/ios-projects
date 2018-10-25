//
//  LoadingViewController.swift
//  LoadingUI
//
//  Created by Daniela Parra on 10/24/18.
//  Copyright © 2018 Daniela Parra. All rights reserved.
//

import Foundation

public class LoadingViewController: UIViewController {
    
    public func setUpAnimatedView(in view: UIView, parent: UIViewController) {
        parent.addChild(self)
        
        self.view.removeFromSuperview()
        
        view.addSubview(animatedView)
        let centerXConstraint = NSLayoutConstraint(item: animatedView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerXWithinMargins, multiplier: 1, constant: 0)
        let centerYConstraint = NSLayoutConstraint(item: animatedView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerYWithinMargins, multiplier: 1, constant: 0)
        let width = NSLayoutConstraint(item: animatedView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 120)
        let height = NSLayoutConstraint(item: animatedView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 120)
        animatedView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([centerXConstraint, centerYConstraint, width, height])
        
        self.didMove(toParent: parent)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        animatedView.startAnimating()
    }
    
    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        animatedView.stopAnimating()
    }
    
    let animatedView = IndeterminateLoadingView(frame: CGRect(x: 0, y: 0, width: 120, height: 120))
    
//    public var isAnimating: Bool = false {
//        didSet {
//            isAnimating ? animatedView.startAnimating() : animatedView.stopAnimating()
//        }
//    }
    
}
