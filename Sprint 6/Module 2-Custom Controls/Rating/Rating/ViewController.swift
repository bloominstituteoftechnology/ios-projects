//
//  ViewController.swift
//  Rating
//
//  Created by Ngozi Ojukwu on 8/28/18.
//  Copyright © 2018 iyin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        let N = ratingControl.value
                if N == 1{
                    self.title = "User Rating: \(N) star"
                }else{
                    self.title = "User Rating: \(N) stars"
                }
    }
}
