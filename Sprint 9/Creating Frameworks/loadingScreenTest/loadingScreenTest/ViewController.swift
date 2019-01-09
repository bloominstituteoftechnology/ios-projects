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
        
        loading.startLoadingAnimation()
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            self.loading.endLoadingAnimation()
        }
    }
    
}
