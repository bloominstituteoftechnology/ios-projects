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
        loadingViewController.backgroundColor = .gray
        loadingViewController.wheelColor = .blue
        loadingViewController.wheelSize = 200
        loadingViewController.wheelThickness = 20
        loadingViewController.modalTransitionStyle = .crossDissolve
        present(loadingViewController, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.loadingViewController.stop()
        }
    }
    
}

