//
//  ViewController.swift
//  loadingScreenTest
//
//  Created by Nikita Thomas on 1/9/19.
//  Copyright © 2019 Nikita Thomas. All rights reserved.
//

import UIKit
import LoadingUI

class ViewController: UIViewController {
    
    var loading = LoadingAnimation()
    
    @IBAction func loadButtonTapped(_ sender: Any) {
        
        self.loading.startLoadingAnimation(forVC: self)
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            self.loading.endLoadingAnimation(forVC: self)
        }
    }
    
}
