//
//  ViewController.swift
//  Custom UIControl - Async
//
//  Created by Ivan Caldwell on 1/15/19.
//  Copyright © 2019 Ivan Caldwell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        if ratingControl.value > 1 {
            self.title = "User Rating: \(ratingControl.value) Stars"
        } else {
            self.title = "User Rating: 1 Star"
        }
    }    
}

