//
//  ViewController.swift
//  LoadingUITest
//
//  Created by Austin Cole on 2/13/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import UIKit
import LoadingUI

class ViewController: LoadingViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func startLoadingButtonWasTapped(_ sender: Any) {
        if startLoadingButton.title(for: .normal) == "Start Loading" {
        animateLoadingView()
        startLoadingButton.setTitle("Stop Loading", for: .normal)
        } else {
            stopAnimatingLoadingView()
            startLoadingButton.setTitle("Start Loading", for: .normal)
        }
    }
    
    @IBOutlet weak var startLoadingButton: UIButton!
}

