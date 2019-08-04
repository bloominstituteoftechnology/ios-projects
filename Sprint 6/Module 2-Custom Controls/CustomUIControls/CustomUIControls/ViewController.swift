//
//  ViewController.swift
//  CustomUIControls
//
//  Created by Daniela Parra on 10/2/18.
//  Copyright © 2018 Daniela Parra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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

