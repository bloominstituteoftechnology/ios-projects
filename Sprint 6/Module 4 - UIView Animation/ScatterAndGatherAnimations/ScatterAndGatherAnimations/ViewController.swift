//
//  ViewController.swift
//  ScatterAndGatherAnimations
//
//  Created by Lisa Sampson on 8/29/18.
//  Copyright © 2018 Lisa Sampson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(lambdaL)
        view.addSubview(lambdaAOne)
        view.addSubview(lambdaM)
        view.addSubview(lambdaB)
        view.addSubview(lambdaD)
        view.addSubview(lambdaATwo)
        view.addSubview(lambdaLogo)
    }

    @IBAction func toggle(_ sender: Any) {
        
        if shouldScramble == false {
            shouldScramble = true
        } else {
            shouldScramble = false
        }
        
        if shouldScramble == true {
            
        } else {
            
        }
    }
    
    var shouldScramble: Bool = false

    @IBOutlet weak var lambdaL: UILabel!
    @IBOutlet weak var lambdaAOne: UILabel!
    @IBOutlet weak var lambdaM: UILabel!
    @IBOutlet weak var lambdaB: UILabel!
    @IBOutlet weak var lambdaD: UILabel!
    @IBOutlet weak var lambdaATwo: UILabel!
    @IBOutlet weak var lambdaLogo: UIImageView!
    
}

