//
//  ViewController.swift
//  UIControl
//
//  Created by Jerrick Warren on 11/13/18.
//  Copyright © 2018 Jerrick Warren. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1894120059, green: 0.5000558496, blue: 0.3323601868, alpha: 1)
        
        
    }

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        
        let rating = ratingControl.value
        if rating == 1 {
            title = "User Rating: \(rating) star"
        } else {
            title = "User Rating: \(rating) stars"
        }
        
    }
    
    
}

