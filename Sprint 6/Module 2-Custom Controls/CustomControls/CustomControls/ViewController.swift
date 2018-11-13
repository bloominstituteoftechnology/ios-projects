//
//  ViewController.swift
//  CustomControls
//
//  Created by Nikita Thomas on 11/13/18.
//  Copyright © 2018 Nikita Thomas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func updateRating(_ sender: CustomControl) {
        if sender.value > 1 {
            self.title = "User Rating: \(sender.value) stars"
        } else {
            self.title = "User Rating: \(sender.value) star"
        }
        
    }
 

}

