//
//  LoadingViewController.swift
//  LoadingUI
//
//  Created by Sergey Osipyan on 2/13/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

import Foundation

open class LoadingViewController: UIViewController {
    
   
    var weel = IndeterminateLoadingView()
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        weel = IndeterminateLoadingView(frame: CGRect(x: view.center.x - 50, y: view.center.y - 175, width: 100, height: 100))
        weel.center = view.center
        weel.startAnimating()
        view.addSubview(weel)
       
    }
 
}
