//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Daniela Parra on 10/3/18.
//  Copyright © 2018 Daniela Parra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func setUp() {
        
        let logoCenterXConstraint = NSLayoutConstraint(item: lambdaImageView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        
        let logoCenterYConstraint = NSLayoutConstraint(item: lambdaImageView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: -20)
        
        NSLayoutConstraint.activate([logoCenterXConstraint, logoCenterYConstraint])
    }
    
    @IBAction func toggle(_ sender: UIBarButtonItem) {
        
        if shouldScramble {
            UIView.animate(withDuration: 3, delay: 0, options: .curveEaseOut, animations: {
                self.lambdaImageView.alpha = 0
            }) { (_) in
                self.shouldScramble = false
            }
        } else {
            UIView.animate(withDuration: 3, delay: 0, options: .curveEaseOut, animations: {
                self.lambdaImageView.alpha = 1
            }) { (_) in
                self.shouldScramble = true
            }
        }
    }
    
    // MARK: - Properties
    
    var shouldScramble = true
    
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var a1Label: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var a2Label: UILabel!
    @IBOutlet weak var lambdaImageView: UIImageView!
    
}

