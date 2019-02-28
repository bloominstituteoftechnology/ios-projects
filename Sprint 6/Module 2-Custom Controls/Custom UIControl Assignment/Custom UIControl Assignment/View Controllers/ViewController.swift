//
//  ViewController.swift
//  Custom UIControl Assignment
//
//  Created by Ivan Caldwell on 1/8/19.
//  Copyright © 2019 Ivan Caldwell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        // This keeps me from having to cast the sender to the right class.
        let numberOfStars = CustomControl.value
        if numberOfStars != 1 {
            self.title = "User Rating: \(numberOfStars) Stars"
        } else {
            self.title = "User Rating: \(numberOfStars) Star"
        }
    }
}

