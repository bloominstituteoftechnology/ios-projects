//
//  LoadingViewController.swift
//  LoadingUI
//
//  Created by TuneUp Shop  on 2/13/19.
//  Copyright © 2019 jkaunert. All rights reserved.
//

import UIKit

open class LoadingViewController: UIViewController {

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        let loader = IndeterminateLoadingView()
        let loaderParentView = UIView()
        loaderParentView.frame = CGRect(x: 0.0, y: 0.0, width: 0.0, height: 0.0)
        loaderParentView.center = self.view.center
        loaderParentView.backgroundColor = .green
        loaderParentView.addSubview(loader)
        self.view.addSubview(loaderParentView)
        
        
        loader.frame = CGRect(x: 0.0, y: 0.0, width: 0.0, height: 0.0)
//        loader.center = loaderParentView.center

        print("loader: \(loader)")
        loader.startAnimating()
        print("View did load: \(self.view!)")
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
