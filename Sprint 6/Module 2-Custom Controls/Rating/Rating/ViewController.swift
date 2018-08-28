//
//  ViewController.swift
//  Rating
//
//  Created by Ngozi Ojukwu on 8/28/18.
//  Copyright © 2018 iyin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let customControl = CustomControl()
    
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        var N = customControl.value
            while N <= 5 {
                if N == 1{
                    self.title = "User Rating: \(N) star"
                }else{
                    self.title = "User Rating: \(N) stars"
                }
                N += 1
            }
    }
}
