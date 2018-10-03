//
//  ViewController.swift
//  Stars Control
//
//  Created by Moin Uddin on 10/2/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        title = "User Rating: \(ratingControl.activeStars) stars"
    }
    

}

