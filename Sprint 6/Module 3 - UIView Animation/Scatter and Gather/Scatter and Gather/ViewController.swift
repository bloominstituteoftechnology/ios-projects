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

    // Disperses and animates
    func scramble() {
        
        UIView.animate(withDuration: 2.0) {
            // Inside this closure, set property we want to animate (and how)  to its final value
            
            // Logo fade
            self.lambdaImage.alpha = 0.1
            
            
            // Color changes
            let colorsArray = [#colorLiteral(red: 0.9921568627, green: 0.7555645778, blue: 0.6809829309, alpha: 1), #colorLiteral(red: 0.9921568627, green: 0.9884961752, blue: 0.5945744201, alpha: 1), #colorLiteral(red: 0.8270156238, green: 0.9921568627, blue: 0.7935259539, alpha: 1), #colorLiteral(red: 0.9921568627, green: 0.8078820973, blue: 0.5530053243, alpha: 1), #colorLiteral(red: 0.9921568627, green: 0.7020843945, blue: 0.8893551545, alpha: 1), #colorLiteral(red: 0.7094560989, green: 1, blue: 0.9118524051, alpha: 1), #colorLiteral(red: 0.7157642889, green: 0.9921568627, blue: 0.9901249554, alpha: 1), #colorLiteral(red: 0.9921568627, green: 0.8674790888, blue: 0.7740682373, alpha: 1), #colorLiteral(red: 0.6328204675, green: 0.8546559514, blue: 0.9921568627, alpha: 1), #colorLiteral(red: 0.8448194713, green: 0.9895079961, blue: 0.9921568627, alpha: 1), #colorLiteral(red: 0.8699099479, green: 0.8043562504, blue: 0.9921568627, alpha: 1)]
            let colorsArrayText = [#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1), #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)]
            
            self.lLabel.textColor = colorsArrayText.randomElement()
            self.aLabel.textColor = colorsArrayText.randomElement()
            self.mLabel.textColor = colorsArrayText.randomElement()
            self.bLabel.textColor = colorsArrayText.randomElement()
            self.dLabel.textColor = colorsArrayText.randomElement()
            self.a2Label.textColor = colorsArrayText.randomElement()
            
            self.lLabel.backgroundColor = colorsArray.randomElement()
            self.aLabel.backgroundColor = colorsArray.randomElement()
            self.mLabel.backgroundColor = colorsArray.randomElement()
            self.bLabel.backgroundColor = colorsArray.randomElement()
            self.dLabel.backgroundColor = colorsArray.randomElement()
            self.a2Label.backgroundColor = colorsArray.randomElement()
            
            
            // Label movements
            self.lLabel.frame.origin.x += CGFloat(Int.random(in: -100..<200))
            self.lLabel.frame.origin.y += CGFloat(Int.random(in: -100..<200))
            
            self.aLabel.frame.origin.x += CGFloat(Int.random(in: -100..<200))
            self.aLabel.frame.origin.y += CGFloat(Int.random(in: -100..<200))
            
            self.mLabel.frame.origin.x += CGFloat(Int.random(in: -100..<200))
            self.mLabel.frame.origin.y += CGFloat(Int.random(in: -100..<200))
            
            self.bLabel.frame.origin.x += CGFloat(Int.random(in: -100..<200))
            self.bLabel.frame.origin.y += CGFloat(Int.random(in: -100..<200))
            
            self.dLabel.frame.origin.x += CGFloat(Int.random(in: -100..<200))
            self.dLabel.frame.origin.y += CGFloat(Int.random(in: -100..<200))
            
            self.a2Label.frame.origin.x += CGFloat(Int.random(in: -100..<200))
            self.a2Label.frame.origin.y += CGFloat(Int.random(in: -100..<200))
        }
        
    }
    
    // Returns to original size and placement
    func gather() {
        
    }
    
    
    @IBAction func toggle(_ sender: Any) {
        
        scramble()
        
        var shouldScramble: Bool = true
        
        
        
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

