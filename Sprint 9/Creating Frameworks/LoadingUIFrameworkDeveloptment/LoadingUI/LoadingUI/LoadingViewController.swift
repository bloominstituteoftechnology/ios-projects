//
//  LoadingViewController.swift
//  LoadingUI
//
//  Created by Austin Cole on 2/13/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import UIKit

open class LoadingViewController: UIViewController {

    override open func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func createIndeterminateLoadingView() {
        if loadingView == nil {
        loadingView = IndeterminateLoadingView(frame: CGRect(x: view.center.x - 50, y: view.center.y - 175, width: 100, height: 100))
        }
    }
    private func addToSubview() {
        if isSubviewOfSuperview == false {
            view.addSubview(loadingView!)
        }
    }
    public func animateLoadingView() {
        createIndeterminateLoadingView()
        addToSubview()
        if !(loadingView?.isAnimating)! {
            loadingView?.startAnimating()
            isSubviewOfSuperview = true
        }
    }
    public func stopAnimatingLoadingView(){
        loadingView?.stopAnimating()
        loadingView?.removeFromSuperview()
        isSubviewOfSuperview = false
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    private var isSubviewOfSuperview = false
    private var loadingView: IndeterminateLoadingView?
}
