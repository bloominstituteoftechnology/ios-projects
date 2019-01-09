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
    
    
    public func startLoadingAnimation(forVC vc: UIViewController) {
        addSignView(forVC: vc)
    }
    
    public func endLoadingAnimation(forVC vc: UIViewController) {
        
        stopAnimation(forVC: vc)
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
