//
//  ViewController.swift
//  Scatter and Gather Animations
//
//  Created by Nikita Thomas on 11/14/18.
//  Copyright © 2018 Nikita Thomas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var letterL: UILabel!
    @IBOutlet weak var letterA: UILabel!
    @IBOutlet weak var letterM: UILabel!
    @IBOutlet weak var letterB: UILabel!
    @IBOutlet weak var letterD: UILabel!
    @IBOutlet weak var letterA2: UILabel!
    
    @IBOutlet weak var logo: UIImageView!
    
    @IBOutlet var letters: [UILabel]!
    
    @IBAction func edcButton(_ sender: Any) {
        shouldScramble.toggle()
        saveCoordinates()
        if shouldScramble {
            breakSimulator()
        } else {
            returnAnim()
            timer.invalidate()
        }
    }
    
    @IBAction func slowButton(_ sender: Any) {
        shouldScramble.toggle()
        saveCoordinates()
        if shouldScramble {
            slowAnimate()
        } else {
            returnAnim()
            timer.invalidate()
        }
    }

    @IBAction func toggle(_ sender: UIBarButtonItem) {
        shouldScramble.toggle()
        saveCoordinates()
        if shouldScramble {
            fastAnimate()
        } else {
            returnAnim()
            timer.invalidate()
        }
    }
    
    var shouldScramble = false
    var timer = Timer()
    
    func fastAnimate() {
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.animate), userInfo: nil, repeats: true)
    }
    
    func breakSimulator() {
        timer = Timer.scheduledTimer(timeInterval: 0, target: self, selector: #selector(self.edcMode), userInfo: nil, repeats: true)
    }
    
    func slowAnimate() {
        timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(self.animate), userInfo: nil, repeats: true)
    }
    
    
    @objc func animate() {
        UIView.animate(withDuration: 4, animations: {
            self.logo.alpha = 0
        }) { (_) in
            UIView.animate(withDuration: 4, animations: {
                self.logo.alpha = 1
            })
        }
        
        for letter in letters {
            let location = randomLocation()
            UIView.animate(withDuration: 0.7) {
//                letter.center.y = location.y
//                letter.center.x = location.x
                var matrix = letter.transform
                matrix.rotated(by: CGFloat.pi / 1)
                matrix.tx = location.x
                matrix.ty = location.y
                
                letter.backgroundColor = self.generateRandomColor()
                letter.textColor = self.generateRandomColor()
                
//                letter.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 1)
                letter.transform = matrix
            }
        }
        view.backgroundColor = generateRandomColor()
    }
    
    @objc func edcMode() {
        UIView.animate(withDuration: 4, animations: {
            self.logo.alpha = 0
        }) { (_) in
            UIView.animate(withDuration: 4, animations: {
                self.logo.alpha = 1
            })
        }

        
        for letter in letters {
            let location = edcRandomLocation()
            UIView.animate(withDuration: 0.1) {
//                letter.center.y = location.y
//                letter.center.x = location.x
                
                var matrix = letter.transform
                matrix.rotated(by: CGFloat.pi / 1)
                matrix.tx = location.x
                matrix.ty = location.y
                
                letter.backgroundColor = self.generateRandomColor()
                letter.textColor = self.generateRandomColor()
                
                //letter.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 1)
                //letter.transform = .identity
                letter.transform = CGAffineTransform(scaleX: 1, y: 1)
                
                letter.transform = matrix
            }
        }
        view.backgroundColor = generateRandomColor()
    }
    
    
 
    
    func randomLocation() -> (x: CGFloat, y: CGFloat) {
        return (CGFloat.random(in: 0...40), CGFloat.random(in: 100...500))
    }
    
    func edcRandomLocation() -> (x: CGFloat, y: CGFloat) {
        return (CGFloat.random(in: 0...10), CGFloat.random(in: 100...200))
    }
    
    func generateRandomColor() -> UIColor {
        let hue : CGFloat = CGFloat(arc4random() % 256) / 256 // use 256 to get full range from 0.0 to 1.0
        let saturation : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from white
        let brightness : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from black
        
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
    
    var xCoordinates: [CGFloat] = [8, 16, 24, 36, 44, 52]
    var yCoordinates: [CGFloat] = [8, 16, 24, 36, 44, 52]
    
    func saveCoordinates() {
        var count = 0
        for letter in letters {
            xCoordinates[count] = letter.center.x
            yCoordinates[count] = letter.center.y
            count += 1
        }
    }
    
    func returnAnim() {
        for letter in letters {
            UIView.animate(withDuration: 2) {
                self.logo.alpha = 1
                letter.transform = .identity
                
                letter.backgroundColor = nil
                letter.textColor = .black
                
                self.view.backgroundColor = .white
            }
        }
    }
    

}

