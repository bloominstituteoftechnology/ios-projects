//
//  ViewController.swift
//  UserStarRating
//
//  Created by Benjamin Hakes on 1/8/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        
        let value = CustomControl.value
        if value > 1{
            self.title = ("User Rating: \(CustomControl.value) stars")
        } else {
            self.title = ("User Rating: \(CustomControl.value) star")
        }
        
    }
    

}

