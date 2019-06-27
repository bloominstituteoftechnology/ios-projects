//
//  LoadingViewController.swift
//  FrameWork
//
//  Created by Ryan Murphy on 6/26/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import UIKit


public class LoadingViewController: UIViewController {
    
    private let indeterminateLoadingView = IndeterminateLoadingView()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        indeterminateLoadingView.startAnimating()
        
    }
    
    
    
}
