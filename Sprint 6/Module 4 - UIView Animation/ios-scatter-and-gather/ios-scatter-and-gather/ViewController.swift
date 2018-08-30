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
    var originalLabelPositions: [CGRect] = []
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
        
        UIView.animate(withDuration: 1) {
            self.lambdaLogoImageView.alpha = 0
            self.lambdaLogoImageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi).concatenating(CGAffineTransform(scaleX: 0.1, y: 0.1))
        }
        
        for label in lambdaCharLabels {
            let navBarHeight = navigationController?.navigationBar.bounds.maxY
            
            let animBlock = {
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.3) {
                    label.layer.position = CGPoint(x: CGFloat.random(in: 0..<self.screenWidth), y: CGFloat.random(in: (navBarHeight ?? 0)..<self.screenHeight))
                }
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.3) {
                    let randomHue = CGFloat(arc4random_uniform(.max))/CGFloat(UInt32.max)
                    label.backgroundColor = UIColor(hue: randomHue, saturation: 1, brightness: 1, alpha: 1)
                }
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.3) {
                    label.shadowColor = .gray
                    label.shadowOffset = CGSize(width: CGFloat(3), height: CGFloat(3))
                }
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.3) {
                    let randomAngle = CGFloat.random(in: 0.0..<360)
                    label.transform = CGAffineTransform(rotationAngle: randomAngle)
                }
                
            }
            
            UIView.animateKeyframes(withDuration: 2,
                                    delay: 0.0,
                                    options: [],
                                    animations: animBlock,
                                    completion: nil)
            
            // ALTERNATIVE
//            CATransaction.begin()
//            // let animation = CAKeyFrameAnimation(keyPath: "position")
//            let animation = CABasicAnimation(keyPath: "position")
//            //animation.values = [CGPoint(x: CGFloat.random(in: 0..<screenWidth), y: CGFloat.random(in: 0..<screenHeight))]
//            animation.fromValue = label.layer.position
//            let newPosition = CGPoint(x: CGFloat.random(in: 0..<screenWidth), y: CGFloat.random(in: 0..<screenHeight))
//            animation.toValue = newPosition
//            animation.duration = 1
//            animation.isRemovedOnCompletion = false
//            label.layer.add(animation, forKey: "scatterAnim")
//
//            CATransaction.setCompletionBlock {
//                label.layer.position = newPosition
//            }
//            CATransaction.commit()
        }
    }
    
    func gather() {
        
        UIView.animate(withDuration: 2) {
            self.lambdaLogoImageView.alpha = 1
            self.lambdaLogoImageView.transform = .identity
        }
        
        for (index, label) in lambdaCharLabels.enumerated() {
            
            UIView.animate(withDuration: 2) {
                
                self.lambdaLogoImageView.alpha = 1
                label.transform = .identity
                label.frame = self.originalLabelPositions[index]
                label.textColor = .black
                label.backgroundColor = .white
                label.shadowColor = .clear
            }

        }
    }
    
    func setupViewElements() {
        var positionX: CGFloat = 85.0
        let componentDimension: CGFloat = 40.0
        let fontSize: CGFloat = 30.0
        let lambdaChars = Array("Lambda")
        var constraints: [NSLayoutConstraint] = []
        
        for char in lambdaChars {
            let label = UILabel(frame: CGRect(x: positionX, y: screenHeight / 2.0, width: componentDimension, height: componentDimension))
            label.font = UIFont.boldSystemFont(ofSize: fontSize)
            label.text = String(char)
            view.addSubview(label)
            
            label.translatesAutoresizingMaskIntoConstraints = false
            let widthConstraints = NSLayoutConstraint(item: label,
                                                      attribute: .centerX,
                                                      relatedBy: .equal,
                                                      toItem: view,
                                                      attribute: .left,
                                                      multiplier: 1.0,
                                                      constant: CGFloat(positionX))
            constraints.append(widthConstraints)
            
            let heightConstraints = NSLayoutConstraint(item: label,
                                                       attribute: .centerY,
                                                       relatedBy: .equal,
                                                       toItem: view,
                                                       attribute: .centerY,
                                                       multiplier: 1.0,
                                                       constant: 0)
            constraints.append(heightConstraints)
            
            positionX += componentDimension + 8
            
            lambdaCharLabels.append(label)
            originalLabelPositions.append(label.frame)
        }
    
        NSLayoutConstraint.activate(constraints)
        
        lambdaLogoImageView?.image = UIImage(named: "lambda_logo")
    }
    
}

