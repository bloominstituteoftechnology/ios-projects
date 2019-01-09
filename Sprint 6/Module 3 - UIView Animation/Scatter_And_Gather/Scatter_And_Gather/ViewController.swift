//
//  ViewController.swift
//  Scatter_And_Gather
//
//  Created by Austin Cole on 1/9/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import UIKit

extension UIView {
    func fadeOut(withDuration duration: TimeInterval = 2.0) {
        UIView.animate(withDuration: duration) {
            self.alpha = 0.0
        }
        
    }
    func fadeIn(withDuration duration: TimeInterval = 2.0) {
    UIView.animate(withDuration: duration) {
    self.alpha = 1.0
    }
    }
    func getRandomNumbers(maxNumber: Int) -> [Int] {
        var randomNumbers: [Int] = []
        let randomNumber = Int(arc4random_uniform(UInt32(maxNumber+1)))
        let randomNumber2 = Int(arc4random_uniform(UInt32(maxNumber - 350)))
        randomNumbers.append(randomNumber2)
        randomNumbers.append(randomNumber)
        return randomNumbers
    }
    
    func scatter(withDuration duration: TimeInterval = 2.0) {
        UIView.animate(withDuration: duration) {
            let randomNumbers = self.getRandomNumbers(maxNumber: 700)
            self.frame = CGRect(x: randomNumbers[0], y: randomNumbers[1], width: 55, height: 55)
        }
    }
    func unscatter(withDuration duration: TimeInterval = 2.0, frame: CGRect) {
        UIView.animate(withDuration: duration) {
            self.frame = frame
        }
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var startALabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var endALabel: UILabel!
    @IBOutlet weak var lambdaLogoImageView: UIImageView!
    
    var shouldScramble = true
    
    var lFrame = CGRect(x: 1, y: 1, width: 1, height: 1)
    var startAFrame = CGRect(x: 1, y: 1, width: 1, height: 1)
    var mFrame = CGRect(x: 1, y: 1, width: 1, height: 1)
    var bFrame = CGRect(x: 1, y: 1, width: 1, height: 1)
    var dFrame = CGRect(x: 1, y: 1, width: 1, height: 1)
    var endAFrame = CGRect(x: 1, y: 1, width: 1, height: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lLabel.backgroundColor = lLabel.backgroundColor?.withAlphaComponent(0.0)
        startALabel.backgroundColor = startALabel.backgroundColor?.withAlphaComponent(0.0)
        mLabel.backgroundColor = mLabel.backgroundColor?.withAlphaComponent(0.0)
        bLabel.backgroundColor = bLabel.backgroundColor?.withAlphaComponent(0.0)
        dLabel.backgroundColor = dLabel.backgroundColor?.withAlphaComponent(0.0)
        endALabel.backgroundColor = endALabel.backgroundColor?.withAlphaComponent(0.0)
    }
    @IBAction func toggle(_ sender: Any) {
        switch shouldScramble {
        case true:
            lFrame = lLabel.frame
            startAFrame = startALabel.frame
            mFrame = mLabel.frame
            bFrame = bLabel.frame
            dFrame = dLabel.frame
            endAFrame = endALabel.frame
            
            shouldScramble = false
            lambdaLogoImageView.fadeOut()
            
            lLabel.scatter()
            startALabel.scatter()
            mLabel.scatter()
            bLabel.scatter()
            dLabel.scatter()
            endALabel.scatter()
            
            UIView.animate(withDuration: 2.0) {
                self.lLabel.layer.backgroundColor = self.getRandomColor(alpha: 0.5).cgColor
            self.startALabel.layer.backgroundColor = self.getRandomColor(alpha: 0.5).cgColor
            self.mLabel.layer.backgroundColor = self.getRandomColor(alpha: 0.5).cgColor
            self.bLabel.layer.backgroundColor = self.getRandomColor(alpha: 0.5).cgColor
            self.dLabel.layer.backgroundColor = self.getRandomColor(alpha: 0.5).cgColor
            self.endALabel.layer.backgroundColor = self.getRandomColor(alpha: 0.5).cgColor
            
                self.lLabel.transform = CGAffineTransform(rotationAngle: .pi)
                self.startALabel.transform = CGAffineTransform(rotationAngle: .pi)
                self.mLabel.transform = CGAffineTransform(rotationAngle: .pi)
                self.bLabel.transform = CGAffineTransform(rotationAngle: .pi)
                self.dLabel.transform = CGAffineTransform(rotationAngle: .pi)
                self.endALabel.transform = CGAffineTransform(rotationAngle: .pi)
            
                self.lLabel.textColor = self.getRandomColor(alpha: 1.0)
                self.startALabel.textColor = self.getRandomColor(alpha: 1.0)
                self.mLabel.textColor = self.getRandomColor(alpha: 1.0)
                self.bLabel.textColor = self.getRandomColor(alpha: 1.0)
                self.dLabel.textColor = self.getRandomColor(alpha: 1.0)
                self.endALabel.textColor = self.getRandomColor(alpha: 1.0)
            }
        case false:
            shouldScramble = true
            lambdaLogoImageView.fadeIn()
            
            lLabel.unscatter(frame: lFrame)
            startALabel.unscatter(frame: startAFrame)
            mLabel.unscatter(frame: mFrame)
            bLabel.unscatter(frame: bFrame)
            dLabel.unscatter(frame: dFrame)
            endALabel.unscatter(frame: endAFrame)
                
            UIView.animate(withDuration: 2.0) {
                self.lLabel.layer.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.0).cgColor
                self.startALabel.layer.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.0).cgColor
                self.mLabel.layer.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.0).cgColor
                self.bLabel.layer.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.0).cgColor
                self.dLabel.layer.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.0).cgColor
                self.endALabel.layer.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.0).cgColor
                
                self.lLabel.transform = CGAffineTransform(rotationAngle: .pi * 2)
                self.startALabel.transform = CGAffineTransform(rotationAngle: .pi * 2)
                self.mLabel.transform = CGAffineTransform(rotationAngle: .pi * 2)
                self.bLabel.transform = CGAffineTransform(rotationAngle: .pi * 2)
                self.dLabel.transform = CGAffineTransform(rotationAngle: .pi * 2)
                self.endALabel.transform = CGAffineTransform(rotationAngle: .pi * 2)
                
                self.lLabel.textColor = .black
                self.startALabel.textColor = .black
                self.mLabel.textColor = .black
                self.bLabel.textColor = .black
                self.dLabel.textColor = .black
                self.endALabel.textColor = .black
            }
            
        }
    }
    func getRandomColor(alpha: CGFloat) -> UIColor {
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    
    

}

