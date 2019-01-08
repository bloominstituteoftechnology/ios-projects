//
//  ViewController.swift
//  CustomControls
//
//  Created by Austin Cole on 1/8/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func updateRating(_ ratingControl: CustomControl) {
//        CustomControl.value > 1 ? self.navigationItem.title = "User Rating: \(CustomControl.value) star" : self.navigationItem.title = "User Rating: \(CustomControl.value) stars"
        switch CustomControl.value {
        case 1:
            self.navigationItem.title = "User Rating: \(CustomControl.value) star"
        default:
            self.navigationItem.title = "User Rating: \(CustomControl.value) stars"
        }
    }
    

}

