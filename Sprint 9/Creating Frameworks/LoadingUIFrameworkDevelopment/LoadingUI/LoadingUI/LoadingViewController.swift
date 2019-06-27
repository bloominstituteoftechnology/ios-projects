//
//  LoadingViewController.swift
//  LoadingUI
//
//  Created by Jonathan Ferrer on 6/26/19.
//  Copyright © 2019 Jonathan Ferrer. All rights reserved.
//


import UIKit

open class LoadingViewController: UIViewController {

    private var loader = IndeterminateLoadingView()

    override open func viewDidLoad() {
        super.viewDidLoad()
    }

    public func startLoading() {

        loader = IndeterminateLoadingView(frame: view.frame)
        self.view.addSubview(loader)
        loader.startAnimating()
        
    }

    public func finishedLoading() {
        loader.stopAnimating()
        loader.removeFromSuperview()
    }

}
