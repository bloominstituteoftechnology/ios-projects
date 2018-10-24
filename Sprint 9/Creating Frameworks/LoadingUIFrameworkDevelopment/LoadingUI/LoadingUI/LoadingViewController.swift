//
//  LoadingViewController.swift
//  LoadingUI
//
//  Created by Iyin Raphael on 10/24/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit

public class LoadingViewController: UIViewController {

    public override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loadingView)
        
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        
        let centerY = loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        let centerX = loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let width = loadingView.widthAnchor.constraint(equalToConstant: 100)
        let height = loadingView.heightAnchor.constraint(equalToConstant: 100)
        NSLayoutConstraint.activate([centerY,centerX, width, height])
    }
    
    
    public func startAnimation(){
        loadingView.startAnimating()
        
    }
    public func endAnimation() {
        loadingView.stopAnimating()
    }
    
    private var loadingView = IndeterminateLoadingView(frame: CGRect(x:0, y: 0, width: 100, height: 100))
}

