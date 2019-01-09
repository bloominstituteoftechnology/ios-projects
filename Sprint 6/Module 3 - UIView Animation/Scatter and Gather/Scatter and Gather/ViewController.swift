//
//  ViewController.swift
//  Scatter and Gather
//
//  Created by Audrey Welch on 1/9/19.
//  Copyright © 2019 Audrey Welch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
 
        
    }

    @IBAction func toggle(_ sender: Any) {
        
        var shouldScramble: Bool = false
        
        UIView.animate(withDuration: 2.0) {
            // Inside this closure, set property we want to animate (and how)  to its final value

            self.lambdaImage.alpha = 0.1
            
            self.lLabel.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.7555645778, blue: 0.6809829309, alpha: 1)
            self.aLabel.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.9884961752, blue: 0.5945744201, alpha: 1)
            self.mLabel.backgroundColor = #colorLiteral(red: 0.8270156238, green: 0.9921568627, blue: 0.7935259539, alpha: 1)
            self.mLabel.textColor = #colorLiteral(red: 0.9921568627, green: 0.8078820973, blue: 0.5530053243, alpha: 1)
            self.bLabel.backgroundColor = #colorLiteral(red: 0.7157642889, green: 0.9921568627, blue: 0.9901249554, alpha: 1)
            self.bLabel.textColor = #colorLiteral(red: 0.9921568627, green: 0.7020843945, blue: 0.8893551545, alpha: 1)
            self.dLabel.backgroundColor = #colorLiteral(red: 0.6328204675, green: 0.8546559514, blue: 0.9921568627, alpha: 1)
            self.a2Label.backgroundColor = #colorLiteral(red: 0.8699099479, green: 0.8043562504, blue: 0.9921568627, alpha: 1)
        }
        
//        let animation = CAKeyframeAnimation(keyPath: "lambdaLogoFade")
//
//        // keyFrames that will happen during the duration
//        //animation.values = [lambdaImage.alpha = 0.1, lambdaImage.alpha = 1]
//
//        animation.duration = 3.0
//
//        CATransaction.begin()
//
//        lambdaImage.layer.add(animation, forKey: "lambdaLogoFadeAnimation")
//
//        CATransaction.setCompletionBlock {
//            self.lambdaImage.alpha = 0.1
//        }
//
//        CATransaction.commit()
        
        
        
        
    }
    
    @IBOutlet weak var lLabel: UILabel!
    
    @IBOutlet weak var aLabel: UILabel!
    
    @IBOutlet weak var mLabel: UILabel!
    
    @IBOutlet weak var bLabel: UILabel!
    
    @IBOutlet weak var dLabel: UILabel!
    
    @IBOutlet weak var a2Label: UILabel!
    
    @IBOutlet weak var lambdaImage: UIImageView!
    
    
    
    
    
    // Manually Creating Labels
//    let font = UIFont(name: "American Typewriter", size: 50)
//    let lLabel = UILabel(frame: CGRect(x: 50, y: 50, width: 50, height: 50))
//    lLabel.translatesAutoresizingMaskIntoConstraints = false
//    lLabel.text = "L"
//    lLabel.font = font
//    lLabel.textColor = #colorLiteral(red: 0.6823529412, green: 0.9960784314, blue: 0.8980392157, alpha: 1)
//
//    view.addSubview(lLabel)
}

