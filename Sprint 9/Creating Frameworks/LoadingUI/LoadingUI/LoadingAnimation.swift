//
//  LoadingAnimation.swift
//  LoadingUI
//
//  Created by Nikita Thomas on 1/9/19.
//  Copyright © 2019 Nikita Thomas. All rights reserved.
//

import UIKit

open class LoadingAnimation {
    
    var signView: SignView
    
    public init() {
        signView = SignView(frame: CGRect.zero)
    }
    
    
    public func startLoadingAnimation() {
        if let currentVC = UIApplication.topViewController() {
            addSignView(forVC: currentVC)
        }
    }
    
    public func endLoadingAnimation() {
        if let currentVC = UIApplication.topViewController() {
            stopAnimation(forVC: currentVC)
        }
    }
    
    func addSignView(forVC vc: UIViewController) {
        signView.frame = CGRect(x: 0,
                                y: 0,
                                width: UIScreen.main.bounds.size.width,
                                height: UIScreen.main.bounds.size.height)
        vc.view.addSubview(signView)
        signView.addAnimationLayer()
    }
    
    func stopAnimation(forVC vc: UIViewController) {
        DispatchQueue.main.async {
            self.signView.animationDuration = 0.0
            self.signView.removeFromSuperview()
        }
        
    }
    
}
