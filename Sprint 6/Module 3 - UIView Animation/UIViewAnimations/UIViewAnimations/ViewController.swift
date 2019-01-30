//
//  ViewController.swift
//  UIViewAnimations
//
//  Created by Nelson Gonzalez on 1/30/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Establish a boolean variable called shouldScramble that you toggle back and forth. You'll animate your views to either scramble them or gather them together when the toggle button is tapped.
    var shouldScramble: Bool = false
    
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var lastLetterLabel: UILabel!
    @IBOutlet weak var lambdaLogoImageView: UIImageView!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func toggleBarButtonItemPressed(_ sender: UIBarButtonItem) {
        if shouldScramble == false {
        lambdaLogoImageView.alpha = 0
           shouldScramble = true
        } else {
            lambdaLogoImageView.alpha = 1
            shouldScramble = false
        }
    }
}

