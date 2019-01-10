//
//  LoadingViewController.swift
//  LoadingUI
//
//  Created by Yvette Zhukovsky on 1/9/19.
//  Copyright © 2019 Yvette Zhukovsky. All rights reserved.
//

import Foundation

public class LoadingViewController: UIViewController {
    
    private var loadingView: IndeterminateLoadingView!
    
    public var circleSize: CGFloat = 80
    public var circleColor: UIColor = .black
    public var thickness: CGFloat = 15
    public var duration: Double = 3
    public var background: UIColor = .white
    
    
    private func settingUpView(){
        view.backgroundColor = background
        let frame = CGRect(x: view.bounds.midX - (circleSize/2), y: view.bounds.midY - (circleSize/2), width: circleSize, height: circleSize)
        
        loadingView = IndeterminateLoadingView(frame: frame, circleColor: circleColor,thickness: thickness, duration: duration )
        view.addSubview(loadingView)
     
    }
    
    
    public func stopAnimation () {
        
        loadingView.stopAnimating()
        dismiss(animated: true)
    }
    
    public func startAnimation() {
        loadingView.startAnimating()
    }
 
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
       settingUpView()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        loadingView.startAnimating()
    }
    
    
}
