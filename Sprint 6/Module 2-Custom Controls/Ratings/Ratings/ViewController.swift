//
//  ViewController.swift
//  Ratings
//
//  Created by Lisa Sampson on 8/28/18.
//  Copyright © 2018 Lisa Sampson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        
        let rating = ratingControl.value
        
        if rating > 1 {
            title = "User Rating: \(rating) stars"
        } else {
            title = "User Rating: \(rating) star"
        }
        
    }
    
}

