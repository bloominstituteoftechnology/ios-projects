//
//  ViewController.swift
//  Async - Scatter and Gather Animations
//
//  Created by Ivan Caldwell on 1/16/19.
//  Copyright © 2019 Ivan Caldwell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var lambda_logo: UIImageView!
    @IBOutlet weak var label_1: UILabel!
    @IBOutlet weak var label_2: UILabel!
    @IBOutlet weak var label_3: UILabel!
    @IBOutlet weak var label_4: UILabel!
    @IBOutlet weak var label_5: UILabel!
    @IBOutlet weak var label_6: UILabel!
    
    // Variables and Constants
    var shouldScramble: Bool = true
    lazy var yLocation = view.center.y
    lazy var xLocation = label_1.center.x
    lazy var labelWidth = label_1.frame.width
    lazy var labelHeight = label_1.frame.height
    lazy var maxWidth = view.frame.width
    lazy var maxHeight = view.frame.height
    lazy var labelArray = [label_1, label_2, label_3, label_4, label_5, label_6]
    
    @IBAction func toggle(_ sender: Any) {
        if shouldScramble {
            for label in labelArray {
                UIView.animate(withDuration: 1.5) {
                    self.lambda_logo.alpha = 0.0
                    label!.center.x = self.getRandomLocationX()
                    label!.center.y = self.getRandomLocationY()
                    label!.backgroundColor = self.getRandomColor()
                    label!.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                    label!.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                    label!.textColor = self.getRandomColor()
                }
            }
        } else {
            lambda_logo.alpha = 1.0
            var labelDistance: CGFloat = 0
            for label in labelArray {
                UIView.animate(withDuration: 0.5) {
                    label!.center.x = self.labelWidth / 2 + labelDistance
                    label!.center.y = self.yLocation
                    label!.backgroundColor = .white
                    labelDistance += self.labelWidth
                    label!.transform = .identity
                    label!.textColor = .black
                }
            }
        }
        shouldScramble = !shouldScramble
    }
    
    // Functions
    func getRandomColor() -> UIColor {
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
    
    func getRandomLocationX() -> CGFloat {
        let number = Float.random(in: Float(0 + labelWidth) ... Float(maxWidth - labelWidth))
        return CGFloat(number)
    }
    
    func getRandomLocationY() -> CGFloat {
        // Huhhhhh... This is annoying...
        let number = Float.random(in: Float(0 + labelHeight * 2) ... Float(maxHeight))
        return CGFloat(number)
    }
}

