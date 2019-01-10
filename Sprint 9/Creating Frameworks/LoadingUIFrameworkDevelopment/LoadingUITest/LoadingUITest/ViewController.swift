//
//  ViewController.swift
//  LoadingUITest
//
//  Created by Dillon McElhinney on 10/24/18.
//  Copyright © 2018 Dillon McElhinney. All rights reserved.
//

import UIKit
import LoadingUI

class ViewController: UIViewController {
    
    var loadingViewController = LoadingViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func presentLoadingUI(_ sender: Any) {
        loadingViewController = LoadingViewController()
        loadingViewController.backgroundColor = .lightGray
        loadingViewController.wheelColor = .green
        loadingViewController.wheelSize = 200
        loadingViewController.wheelThickness = 30
        loadingViewController.modalTransitionStyle = .crossDissolve
        present(loadingViewController, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 30) {
            self.loadingViewController.stop()
        }
    }
    
}

