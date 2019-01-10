//
//  ViewController.swift
//  LoadingUITest
//
//  Created by Yvette Zhukovsky on 1/9/19.
//  Copyright © 2019 Yvette Zhukovsky. All rights reserved.
//

import UIKit
import LoadingUI


class ViewController: UIViewController {

    
    var loadingVC = LoadingViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func loadView(_ sender: Any) {
        
       
       loadingVC.background = .purple
        loadingVC.circleSize = 400
        loadingVC.circleColor = .yellow
        loadingVC.thickness = 3
        loadingVC.duration = 4
        loadingVC.modalTransitionStyle = .crossDissolve
        present(loadingVC, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.loadingVC.stopAnimation()
        }
    }
    
}

