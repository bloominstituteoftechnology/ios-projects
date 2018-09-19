//
//  LoadingViewController.swift
//  Loading UI
//
//  Created by Lisa Sampson on 9/19/18.
//  Copyright © 2018 Lisa Sampson. All rights reserved.
//

import UIKit

public class LoadingViewController: UIViewController {

    override public func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(indeterminateLoadingView)
        
        indeterminateLoadingView.translatesAutoresizingMaskIntoConstraints = false
        
        let centerY = indeterminateLoadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        let centerX = indeterminateLoadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let widthConstraint = indeterminateLoadingView.widthAnchor.constraint(equalToConstant: 150)
        let heightConstraint = indeterminateLoadingView.heightAnchor.constraint(equalToConstant: 150)
            
//        let centerY = NSLayoutConstraint(item: indeterminateLoadingView,
//                                         attribute: .centerY,
//                                         relatedBy: .equal,
//                                         toItem: view,
//                                         attribute: .centerY,
//                                         multiplier: 1.0,
//                                         constant: 0)
        
//        let centerX = NSLayoutConstraint(item: indeterminateLoadingView,
//                                         attribute: .centerX,
//                                         relatedBy: .equal,
//                                         toItem: view,
//                                         attribute: .centerX,
//                                         multiplier: 1.0,
//                                         constant: 0)
        
        NSLayoutConstraint.activate([centerY, centerX, widthConstraint, heightConstraint])
    }
    
    public func startAnimation() {
        indeterminateLoadingView.startAnimating()
    }
    
    public func stopAnimation() {
        indeterminateLoadingView.stopAnimating()
    }

    let indeterminateLoadingView = IndeterminateLoadingView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
    
}
