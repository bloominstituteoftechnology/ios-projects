//
//  ViewController.swift
//  ios-scatter-and-gather
//
//  Created by De MicheliStefano on 29.08.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lambdaLogoImageView: UIImageView!
    var lambdaCharLabels: [UILabel] = []
    let screenWidth: CGFloat = UIScreen.main.bounds.width
    let screenHeight: CGFloat = UIScreen.main.bounds.height
    
    var shouldScramble: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewElements()
    }

    @IBAction func toggle(_ sender: Any) {
        shouldScramble = !shouldScramble
        shouldScramble ? scatter() : gather()
    }
    
    func scatter() {
        for label in lambdaCharLabels {
            CATransaction.begin()
            // let animation = CAKeyFrameAnimation(keyPath: "position")
            let animation = CABasicAnimation(keyPath: "position")
            //animation.values = [CGPoint(x: CGFloat.random(in: 0..<screenWidth), y: CGFloat.random(in: 0..<screenHeight))]
            animation.fromValue = label.layer.position
            let newPosition = CGPoint(x: CGFloat.random(in: 0..<screenWidth), y: CGFloat.random(in: 0..<screenHeight))
            animation.toValue = newPosition
            animation.duration = 2
            animation.isRemovedOnCompletion = false
            label.layer.add(animation, forKey: "postionAnim")
            
            CATransaction.setCompletionBlock {
                label.layer.position = newPosition
            }
            CATransaction.commit()
        }
    }
    
    func gather() {
        
    }
    
    func setupViewElements() {
        var widthConstraint = -65.0
        let componentDimension = 40.0
        let fontSize: CGFloat = 30.0
        let lambdaChars = Array("Lambda")
        var constraints: [NSLayoutConstraint] = []
        
        for char in lambdaChars {
            let label = UILabel()
            label.frame = CGRect(x: componentDimension, y: componentDimension, width: componentDimension, height: componentDimension)
            label.font = UIFont.boldSystemFont(ofSize: fontSize)
            label.text = String(char)
            view.addSubview(label)
            lambdaCharLabels.append(label)
            
            label.translatesAutoresizingMaskIntoConstraints = false
            let widthConstraints = NSLayoutConstraint(item: label,
                                                      attribute: .centerX,
                                                      relatedBy: .equal,
                                                      toItem: view,
                                                      attribute: .centerX,
                                                      multiplier: 1.0,
                                                      constant: CGFloat(widthConstraint))
            constraints.append(widthConstraints)
            
            let heightConstraints = NSLayoutConstraint(item: label,
                                                       attribute: .centerY,
                                                       relatedBy: .equal,
                                                       toItem: view,
                                                       attribute: .centerY,
                                                       multiplier: 1.0,
                                                       constant: 0)
            constraints.append(heightConstraints)
            
            widthConstraint += 25
        }
    
        NSLayoutConstraint.activate(constraints)
        
        lambdaLogoImageView?.image = UIImage(named: "lambda_logo")
    }
    
}

