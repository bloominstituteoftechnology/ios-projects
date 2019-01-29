//
//  ViewController.swift
//  Custom UIControl
//
//  Created by Moses Robinson on 1/29/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func updateRating(_ sender: CustomControl) {
        title = "User Rating: \(sender.value) stars "
    }
}

