//
//  TestViewController.swift
//  LoadingUITest
//
//  Created by Daniela Parra on 10/24/18.
//  Copyright © 2018 Daniela Parra. All rights reserved.
//

import UIKit
import LoadingUI

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        loadingVC.setUpAnimatedView(in: view, parent: self)
    }
    
    let loadingVC = LoadingViewController()
}
