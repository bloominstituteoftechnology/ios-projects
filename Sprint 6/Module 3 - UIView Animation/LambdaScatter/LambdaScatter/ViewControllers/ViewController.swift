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
            shouldScramble = 0
            
            
            CATransaction.begin()
            CATransaction.setCompletionBlock {
            }

            for subView in lambdaTextView.subviews{
                
                UIView.animate(withDuration: 1) {
                    var frame = subView.frame
                    frame.origin.y += 100
                    subView.frame = frame
                }
                
            }
            
            UIView.animate(withDuration: 1) {
                self.lambdaLogo.alpha = 0.0
            }
            
            CATransaction.commit()
            
            
        } else {
            shouldScramble = 1
            
            CATransaction.begin()
            CATransaction.setCompletionBlock {
            }
            
            for subView in lambdaTextView.subviews{
                
                UIView.animate(withDuration: 1) {
                    var frame = subView.frame
                    frame.origin.y -= 100
                    subView.frame = frame
                }
                
            }
            
            UIView.animate(withDuration: 1) {
                self.lambdaLogo.alpha = 1.0
            }
            
            CATransaction.commit()
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

