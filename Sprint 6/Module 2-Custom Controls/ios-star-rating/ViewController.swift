//
//  ViewController.swift
//  ios-star-rating
//
//  Created by De MicheliStefano on 28.08.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        title = "User Rating: \(ratingControl.value) "
                + (ratingControl.value > 1 ? "stars" : "star")
    }
    
}

