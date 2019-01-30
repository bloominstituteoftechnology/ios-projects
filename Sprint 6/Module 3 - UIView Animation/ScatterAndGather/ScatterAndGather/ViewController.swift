//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Angel Buenrostro on 1/30/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var shouldScramble : Bool = false
    
    @IBAction func toggleButtonTapped(_ sender: Any) {
        shouldScramble = !shouldScramble
        
        if shouldScramble {
            // scramble the letters
        } else {
            // revert scrambling
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

