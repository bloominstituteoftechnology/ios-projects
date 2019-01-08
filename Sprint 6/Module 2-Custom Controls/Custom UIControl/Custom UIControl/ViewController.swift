//
//  ViewController.swift
//  Custom UIControl
//
//  Created by Audrey Welch on 1/8/19.
//  Copyright © 2019 Audrey Welch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let customControl = CustomControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set View Controller's title
        if customControl.value > 1 {
            let stars = "stars"
            navigationItem.title = "User Rating: \(customControl.value) \(stars)"
        } else {
            let stars = "star"
            navigationItem.title = "User Rating: \(customControl.value) \(stars)"
        }
    }

    
    
    // Allows the control's client (view controller) to receive updates about changes in the rating control
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        
    }
    
}

