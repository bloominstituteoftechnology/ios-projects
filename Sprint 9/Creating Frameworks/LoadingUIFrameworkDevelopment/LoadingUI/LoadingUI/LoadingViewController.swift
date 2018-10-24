//
//  LoadingViewController.swift
//  LoadingUI
//
//  Created by Moin Uddin on 10/24/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import Foundation

public class LoadingViewController: UIViewController {
    
    
    public override func viewDidLoad() {
        view.backgroundColor = .darkGray
        view.addSubview(loadingView)
        centerLoadingView()
    }
    
    private func centerLoadingView() {
        loadingView.center = view.convert(view.center, from: view.superview)
    }
    
    public func startAnimation() {
        loadingView.startAnimating()
    }
    
    private(set) var loadingView = IndeterminateLoadingView(frame: CGRect(x:0, y: 0, width: 150, height: 150))
}
