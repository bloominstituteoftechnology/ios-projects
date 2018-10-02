//
//  StarViewController.swift
//  Custom Control
//
//  Created by Iyin Raphael on 10/2/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit

class StarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
    }
    
    @IBAction func updateRating(_ rateControl: CustomControl) {
    
        let value: Int = rateControl.value
        if value > 1{
            self.navigationController?.title = "User rating: \(value) Stars"
        } else {
            self.navigationController?.title = "User rating: \(value) Star"
        }
    }
    

}
