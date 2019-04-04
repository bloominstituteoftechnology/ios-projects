//
//  ViewController.swift
//  LoadingUITest
//
//  Created by Moses Robinson on 3/6/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

import UIKit
import LoadingUI

class ViewController: UIViewController {

    @IBAction func activateLoading(_ sender: Any) {
        
        let loadingViewController = LoadingViewController()
        
        present(loadingViewController, animated: true, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            loadingViewController.stopAnimation()
        }
    }
    
}

