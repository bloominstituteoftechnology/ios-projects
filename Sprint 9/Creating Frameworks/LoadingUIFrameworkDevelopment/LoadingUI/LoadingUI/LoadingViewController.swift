//
//  LoadingViewController.swift
//  Calculator
//
//  Created by Ivan Caldwell on 2/14/19.
//  Copyright © 2019 Spencer Curtis. All rights reserved.
//

import UIKit

open class LoadingViewController: UIViewController {

    var indeterminateLoadingView = IndeterminateLoadingView()
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        indeterminateLoadingView = IndeterminateLoadingView(frame: CGRect(x: view.center.x, y: view.center.y, width: 150, height: 150))
        indeterminateLoadingView.center = view.center
        indeterminateLoadingView.startAnimating()
        view.addSubview(indeterminateLoadingView)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
