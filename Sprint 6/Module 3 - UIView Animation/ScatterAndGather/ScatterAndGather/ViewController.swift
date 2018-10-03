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
        
        //setUp()
    }
    
    private func setUp() {
        
        let logoCenterXConstraint = NSLayoutConstraint(item: lambdaImageView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        
        let logoCenterYConstraint = NSLayoutConstraint(item: lambdaImageView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: -20)
        
        NSLayoutConstraint.activate([logoCenterXConstraint, logoCenterYConstraint])
    }
    
    @IBAction func toggle(_ sender: UIBarButtonItem) {
        let labels: [UILabel] = [self.lLabel, self.a1Label, self.mLabel, self.bLabel, self.dLabel, self.a2Label]
        
        if shouldScramble {
            UIView.animate(withDuration: 2, delay: 0, options: .curveEaseOut, animations: {
                
                for label in labels {
                    let superViewWidth = self.view.frame.size.width
                    let randomX = CGFloat.random(in: 0..<superViewWidth)
                    let superViewHeight = self.view.frame.size.height
                    let randomY = CGFloat.random(in: 0..<superViewHeight)
                    let randomRadian = CGFloat.random(in: 0...CGFloat.pi)
                    let randomTextColor = UIColor.random
                    let randomColor = UIColor.random
                    
                    label.transform = CGAffineTransform.init(translationX: randomX, y: randomY).rotated(by: randomRadian)
                    label.textColor = randomTextColor
                    label.backgroundColor = randomColor.withAlphaComponent(0.5)
                }
//                self.lLabel.transform = CGAffineTransform.init(translationX: randomX, y: randomY).rotated(by: randomRadian)
//                self.a1Label.transform = CGAffineTransform.init(translationX: randomX, y: randomY).rotated(by: randomRadian)
//                self.mLabel.transform = CGAffineTransform.init(translationX: randomX, y: randomY).rotated(by: randomRadian)
//                self.bLabel.transform = CGAffineTransform.init(translationX: randomX, y: randomY).rotated(by: randomRadian)
//                self.dLabel.transform = CGAffineTransform.init(translationX: randomX, y: randomY).rotated(by: randomRadian)
//                self.a2Label.transform = CGAffineTransform.init(translationX: randomX, y: randomY).rotated(by: randomRadian)
                
                //Makes logo transparent.
                self.lambdaImageView.alpha = 0
            }) { (_) in
                self.shouldScramble = false
            }
        } else {
            UIView.animate(withDuration: 2, delay: 0, options: .curveEaseOut, animations: {
                
                for label in labels {
                    label.transform = .identity
                    label.textColor = UIColor.black
                    label.backgroundColor = UIColor.clear
                }
                
                self.lambdaImageView.alpha = 1
            }) { (_) in
                self.shouldScramble = true
            }
        }
    }
    
    // MARK: - Properties
    
    var shouldScramble = true
    let colors: [UIColor] = [.black, .brown, .blue, .cyan, .darkGray, .gray, .green, .lightGray, .magenta, .orange, .purple, .red, .yellow]
    
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var a1Label: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var a2Label: UILabel!
    @IBOutlet weak var lambdaImageView: UIImageView!
    
}

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}
