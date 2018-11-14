//
//  ViewController.swift
//  Custom Controls
//
//  Created by Sean Hendrix on 11/13/18.
//  Copyright © 2018 Sean Hendrix. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var n = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //title = "User Rating: \(n) stars"
    }

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        if ratingControl.value > 1 {
            self.title = "User Rating: \(ratingControl.value) beers"
        } else {
            self.title = "User Rating: \(ratingControl.value) beer"
        }
        
    }
    
}

