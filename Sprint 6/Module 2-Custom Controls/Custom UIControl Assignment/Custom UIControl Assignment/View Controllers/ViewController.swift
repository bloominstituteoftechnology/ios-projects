//
//  ViewController.swift
//  Custom UIControl Assignment
//
//  Created by Ivan Caldwell on 1/8/19.
//  Copyright © 2019 Ivan Caldwell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "User Rating: N Stars"
    }


    @IBAction func updateRating(_ ratingControl: CustomControl) {
        // This keeps me from having to cast the sender to the right class.
        
    }
    
    
}

