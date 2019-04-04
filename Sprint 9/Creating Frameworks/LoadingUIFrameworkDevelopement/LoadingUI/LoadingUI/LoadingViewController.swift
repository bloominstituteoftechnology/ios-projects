//
//  LoadingViewController.swift
//  LoadingUI
//
//  Created by Moses Robinson on 3/6/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

import Foundation

public class LoadingViewController: UIViewController {
    
    private var indeterminateLoadingView: IndeterminateLoadingView!
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        createView()
        startAnimation()
    }
    
    private func createView() {
        
        let frame = CGRect(x: view.bounds.midX - 60/2, y: view.bounds.midY - 60/2, width: 60, height: 60)
        
        indeterminateLoadingView = IndeterminateLoadingView(frame: frame)
        
        view.backgroundColor = .white
        view.addSubview(indeterminateLoadingView)
    }
   
    public func startAnimation() {
        indeterminateLoadingView.startAnimating()
    }
    
    public func stopAnimation () {
        
        indeterminateLoadingView.stopAnimating()
        dismiss(animated: true, completion: nil)
    }
}
