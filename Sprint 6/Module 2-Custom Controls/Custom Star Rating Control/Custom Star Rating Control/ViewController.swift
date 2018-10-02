//
//  ViewController.swift
//  Custom Star Rating Control
//
//  Created by Dillon McElhinney on 10/2/18.
//  Copyright © 2018 Dillon McElhinney. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        title = "User Rating: \(ratingControl.value) \(ratingControl.value == 1 ? "star" : "stars")"
    }
    
}

