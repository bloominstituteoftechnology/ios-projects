//
//  LoadingViewController.swift
//  LoadingUI
//
//  Created by Dillon McElhinney on 10/24/18.
//  Copyright © 2018 Dillon McElhinney. All rights reserved.
//

import UIKit

public class LoadingViewController: UIViewController {
    
    private var loadingView: IndeterminateLoadingView!
    /// Sets the background color of LoadingViewController's view controller
    public var backgroundColor: UIColor = .white
    /// Sets the main color used for the loading wheel
    public var wheelColor: UIColor = .black
    /// Sets the size of the view used for the loading wheel
    public var wheelSize: CGFloat = 100
    /// Sets the thickness of the loading wheel
    public var wheelThickness: CGFloat = 10.0
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupView()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        loadingView.startAnimating()
    }
    
    /// Stops the loading view and dismisses loading view controller
    public func stop() {
        loadingView.stopAnimating()
        dismiss(animated: true)
    }
    
    private func setupView() {
        view.backgroundColor = backgroundColor
        let frame = CGRect(x: view.bounds.midX - (wheelSize/2), y: view.bounds.midY - (wheelSize/2), width: wheelSize, height: wheelSize)
        loadingView = IndeterminateLoadingView(frame: frame, strokeColor: wheelColor, thickness: wheelThickness)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loadingView)

        // TODO: Figure out why constraints aren't working
//        let widthConstsraint = NSLayoutConstraint(item: loadingView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50)
//        let heightConstraint = NSLayoutConstraint(item: loadingView, attribute: .height, relatedBy: .equal, toItem: loadingView, attribute: .width, multiplier: 1.0, constant: 0)
//        let centerYConstraint = NSLayoutConstraint(item: loadingView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0)
//        let centerXConstraint = NSLayoutConstraint(item: loadingView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0)
//
//        NSLayoutConstraint.activate([widthConstsraint, heightConstraint])
        
    }

}
