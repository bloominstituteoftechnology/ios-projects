//
//  ViewController.swift
//  Scatter and Gather
//
//  Created by Dillon McElhinney on 10/2/18.
//  Copyright © 2018 Dillon McElhinney. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var shouldScramble = true

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet var labels: [UILabel]!

    @IBAction func toggle(_ sender: Any) {
        if shouldScramble {
            scramble()
        } else {
            unscramble()
        }
        shouldScramble = !shouldScramble
    }
    
    private func scramble() {
        let animBlock = {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.35) {
                self.logoImageView.alpha = 0
                for label in self.labels {
                    label.transform = self.randomTranslation(for: label)
                }
            }
            UIView.addKeyframe(withRelativeStartTime: 0.35, relativeDuration: 0.65) {
                for label in self.labels {
                    label.transform = self.randomTranslation(for: label)
                }
            }
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1) {
                for label in self.labels {
                    label.layer.backgroundColor = self.randomColor().cgColor
                }
            }
        }
        
        UIView.animateKeyframes(withDuration: 2.0, delay: 0.0, options: [], animations: animBlock)
    }
    
    private func unscramble() {
        UIView.animate(withDuration: 1) {
            self.logoImageView.alpha = 1
            for label in self.labels {
                label.transform = .identity
                label.layer.backgroundColor = UIColor.white.cgColor
            }
            
        }
    }
    
    private func randomColor() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
    private func randomTranslation(for label: UILabel) -> CGAffineTransform {
        let minX = -label.frame.origin.x + self.view.safeAreaInsets.left
        let maxX = self.view.frame.width - (label.frame.origin.x + label.frame.width + self.view.safeAreaInsets.right)
        let x = (CGFloat.random(in: minX...maxX))
        let minY = -label.frame.origin.y + self.view.safeAreaInsets.top
        let maxY = self.view.frame.height - (label.frame.origin.y + label.frame.height + self.view.safeAreaInsets.bottom)
        let y = (CGFloat.random(in: minY...maxY))
        return CGAffineTransform(translationX: x, y: y).rotated(by: CGFloat.random(in: -2*CGFloat.pi...2*CGFloat.pi))
    }
}

