//
//  LoadingViewController.swift
//  LoadingUI
//
//  Created by Dillon McElhinney on 10/24/18.
//  Copyright © 2018 Dillon McElhinney. All rights reserved.
//

import UIKit

public class LoadingViewController: UIViewController {
    
    // MARK: - Properties
    private var loadingView: IndeterminateLoadingView!
    
    /// Sets the background color of LoadingViewController's view controller
    public var backgroundColor: UIColor = .white
    
    /// Sets the main color used for the loading wheel
    public var wheelColor: UIColor = .black
    
    /// Sets the size of the view used for the loading wheel
    public var wheelSize: CGFloat = 100 {
        didSet {
            let thickness = wheelThickness
            wheelThickness = thickness
        }
    }
    
    /// Sets the thickness of the loading wheel
    public var wheelThickness: CGFloat = 10.0 {
        didSet {
            let maxValue = wheelSize/4 < 50 ? wheelSize/4 : 50
            if wheelThickness < 10 {
                wheelThickness = 10
            } else if wheelThickness > maxValue {
                wheelThickness = maxValue
            }
        }
    }
    
    // MARK: - Initializers
    public override init(nibName nibNameOrNil: String? = nil, bundle nibBundleOrNil: Bundle? = nil) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.modalTransitionStyle = .crossDissolve
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented.")
    }
    
    // MARK: - Lifecycle Methods
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupView()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        loadingView.startAnimating()
    }
    
    // MARK: - Public UI
    /// Stops the loading view and dismisses loading view controller
    public func stop() {
        dismiss(animated: true)
        loadingView.stopAnimating()
        loadingView.removeFromSuperview()
    }
    
    // MARK: - Utility Methods
    private func setupView() {
        view.backgroundColor = backgroundColor
        let frame = CGRect(x: view.bounds.midX - (wheelSize/2), y: view.bounds.midY - (wheelSize/2), width: wheelSize, height: wheelSize)
        loadingView = IndeterminateLoadingView(frame: frame, strokeColor: wheelColor, thickness: wheelThickness)
        view.addSubview(loadingView)
    }
}
