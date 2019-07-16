//
//  ViewController.swift
//  StarControl
//
//  Created by Jocelyn Stuart on 1/29/19.
//  Copyright © 2019 JS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        if ratingControl.value == 1 {
            self.title = "User Rating: 1 Star"
        } else {
            self.title = "User Rating: \(ratingControl.value) Stars"
        }
        
        
    }
    
    


}

