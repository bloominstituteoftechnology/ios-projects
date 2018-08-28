//
//  ViewController.swift
//  Custom Control
//
//  Created by Jeremy Taylor on 8/28/18.
//  Copyright © 2018 Bytes-Random L.L.C. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func updateRating(_ sender: CustomControl) {
        if sender.value == 1 {
            navigationController?.title = "User Rating: 1 star"
        } else {
            navigationController?.title = "User Rating: \(sender.value) stars"
        }
    }
    
}

