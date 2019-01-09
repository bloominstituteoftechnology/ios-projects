//
//  LoadingAnimation.swift
//  LoadingUI
//
//  Created by Nikita Thomas on 1/9/19.
//  Copyright © 2019 Nikita Thomas. All rights reserved.
//

import UIKit

open class LoadingAnimation {
    
    var signView: SignView?
    
    public init() {}
    
    
    public func startLoadingAnimation() {
        signView = SignView(frame: CGRect.zero)
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
        guard let signView = signView else { return }
        signView.frame = CGRect(x: 0,
                                y: 0,
                                width: UIScreen.main.bounds.size.width,
                                height: UIScreen.main.bounds.size.height)
        vc.view.addSubview(signView)
        signView.addAnimationLayer()
    }
    
    func stopAnimation(forVC vc: UIViewController) {
        guard let signView = signView else { return }
        DispatchQueue.main.async {
            signView.animationDuration = 0.0
            signView.removeFromSuperview()
        }
        
    }
    
}
