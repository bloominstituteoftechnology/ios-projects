//
//  ViewController.swift
//  LambdaScatter
//
//  Created by Benjamin Hakes on 1/9/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var shouldScramble: Int = 1
    
    let lambdaLogo = UIImageView(frame: CGRect(x: 100, y: 300, width: 200, height: 200))
    
    let lambdaTextView = CustomControl(frame: CGRect(x: 0.0, y: 0.0, width: 200, height: 100))
    
    @IBAction func makeMagic(_ sender: Any) {
        
        if shouldScramble == 1 {
//            CATransaction.begin()
//            CATransaction.setCompletionBlock {
//                self.lambdaTextView.layer.backgroundColor = UIColor.red.cgColor
//            }
//            let animation = CAKeyframeAnimation(keyPath: "backgroundColor")
//            animation.values = [UIColor.black.cgColor, UIColor.blue.cgColor, UIColor.red.cgColor]
//            animation.duration = 2.0
//            
//            
//            let animation2 = CAKeyframeAnimation(keyPath: "osillate")
//            let rectPath = CGRect(origin: greenSquare.center, size: CGSize(width: 100, height: 100))
//            //        animation2.path = CGPath(rect: rectPath, transform: nil)
            //        animation2.duration = 2.0
            //        greenSquare.layer.add(animation2, forKey: "osillateAnimation")
            //        greenSquare.layer.add(animation, forKey: "backgroundColorAnimation")
            //        CATransaction.commit()
            //
            
            
            UIView.animate(withDuration: 2) {
                self.lambdaLogo.alpha = 0.0
            }
        } else {
            UIView.animate(withDuration: 2) {
                self.lambdaLogo.alpha = 1.0
            }
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        lambdaLogo.image = UIImage(named: "lambda")
        view.addSubview(lambdaLogo)
        
        lambdaTextView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(lambdaTextView)

        let centerXConstraint = NSLayoutConstraint(
            item: lambdaTextView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: view,
            attribute: .centerX,
            multiplier: 1.0,
            constant: 0.0)
        
        let topConstraint = NSLayoutConstraint(
            item: lambdaTextView,
            attribute: .top,
            relatedBy: .equal,
            toItem: view,
            attribute: .top,
            multiplier: 1.0,
            constant: 100.0)
 
        NSLayoutConstraint.activate([centerXConstraint, topConstraint])
    }


}

