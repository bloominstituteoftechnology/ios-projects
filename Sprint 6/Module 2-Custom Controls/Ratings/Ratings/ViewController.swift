//
//  ViewController.swift
//  Ratings
//
//  Created by Nelson Gonzalez on 1/29/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func updateRating(_ ratingControl: CustomControl) {
        if ratingControl.value <= 1 {
            navigationItem.title = "User Rating: \(ratingControl.value) star"
        } else {
        navigationItem.title = "User Rating: \(ratingControl.value) stars"
        }
    }
}

