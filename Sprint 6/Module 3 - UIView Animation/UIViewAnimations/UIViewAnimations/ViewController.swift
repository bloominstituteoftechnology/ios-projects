//
//  ViewController.swift
//  UIViewAnimations
//
//  Created by Nelson Gonzalez on 1/30/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Establish a boolean variable called shouldScramble that you toggle back and forth. You'll animate your views to either scramble them or gather them together when the toggle button is tapped.
    var shouldScramble: Bool = false
    
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var lastLetterLabel: UILabel!
    @IBOutlet weak var lambdaLogoImageView: UIImageView!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func toggleBarButtonItemPressed(_ sender: UIBarButtonItem) {
        if shouldScramble == false {
           scatter()
           
        } else {
            
            gather()
        }
        
        shouldScramble = !shouldScramble
    }
    
    func scatter() {
        UIView.animate(withDuration: 3) {
            self.lambdaLogoImageView.alpha = 0
            
            
            // Color changes
            let backgroundColorsArray = [#colorLiteral(red: 0.9921568627, green: 0.7555645778, blue: 0.6809829309, alpha: 1), #colorLiteral(red: 0.9921568627, green: 0.9884961752, blue: 0.5945744201, alpha: 1), #colorLiteral(red: 0.8270156238, green: 0.9921568627, blue: 0.7935259539, alpha: 1), #colorLiteral(red: 0.9921568627, green: 0.8078820973, blue: 0.5530053243, alpha: 1), #colorLiteral(red: 0.9921568627, green: 0.7020843945, blue: 0.8893551545, alpha: 1), #colorLiteral(red: 0.7094560989, green: 1, blue: 0.9118524051, alpha: 1), #colorLiteral(red: 0.7157642889, green: 0.9921568627, blue: 0.9901249554, alpha: 1), #colorLiteral(red: 0.9921568627, green: 0.8674790888, blue: 0.7740682373, alpha: 1), #colorLiteral(red: 0.6328204675, green: 0.8546559514, blue: 0.9921568627, alpha: 1), #colorLiteral(red: 0.8448194713, green: 0.9895079961, blue: 0.9921568627, alpha: 1), #colorLiteral(red: 0.8699099479, green: 0.8043562504, blue: 0.9921568627, alpha: 1)]
            let textColorArray = [#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)]
            
            
            //Change the text color by picking a random color from the colorsArrayText
            self.lLabel.textColor = textColorArray.randomElement()
            self.aLabel.textColor = textColorArray.randomElement()
            self.mLabel.textColor = textColorArray.randomElement()
            self.bLabel.textColor = textColorArray.randomElement()
            self.dLabel.textColor = textColorArray.randomElement()
            self.lastLetterLabel.textColor = textColorArray.randomElement()
            
            
            self.lLabel.backgroundColor = backgroundColorsArray.randomElement()
            self.aLabel.backgroundColor = backgroundColorsArray.randomElement()
            self.mLabel.backgroundColor = backgroundColorsArray.randomElement()
            self.bLabel.backgroundColor = backgroundColorsArray.randomElement()
            self.dLabel.backgroundColor = backgroundColorsArray.randomElement()
            self.lastLetterLabel.backgroundColor = backgroundColorsArray.randomElement()
            
            
            // Label movements & rotations
            self.lLabel.transform = CGAffineTransform(translationX: CGFloat(Int.random(in: -100..<200)), y: CGFloat(Int.random(in: -50..<200))).rotated(by: CGFloat(Float.random(in: -2...2)))
            self.aLabel.transform = CGAffineTransform(translationX: CGFloat(Int.random(in: -100..<200)), y: CGFloat(Int.random(in: -50..<200))).rotated(by: CGFloat(Float.random(in: -2...1)))
            self.mLabel.transform = CGAffineTransform(translationX: CGFloat(Int.random(in: -100..<200)), y: CGFloat(Int.random(in: -50..<200))).rotated(by: CGFloat(Float.random(in: -2...1)))
            self.bLabel.transform = CGAffineTransform(translationX: CGFloat(Int.random(in: -100..<200)), y: CGFloat(Int.random(in: -50..<200))).rotated(by: CGFloat(Float.random(in: -2...1)))
            self.dLabel.transform = CGAffineTransform(translationX: CGFloat(Int.random(in: -100..<200)), y: CGFloat(Int.random(in: -50..<200))).rotated(by: CGFloat(Float.random(in: -2...1)))
            self.lastLetterLabel.transform = CGAffineTransform(translationX: CGFloat(Int.random(in: -100..<200)), y: CGFloat(Int.random(in: -50..<200))).rotated(by: CGFloat(Float.random(in: -2...1)))
    
        }
    }
    
    func gather() {
        
        UIView.animate(withDuration: 3) {
            self.lambdaLogoImageView.alpha = 1
            
            
            // Reset text color back to their original state
            self.lLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            self.aLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            self.mLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            self.bLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            self.dLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            self.lastLetterLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            
            self.lLabel.backgroundColor = .white
            self.aLabel.backgroundColor = .white
            self.mLabel.backgroundColor = .white
            self.bLabel.backgroundColor = .white
            self.dLabel.backgroundColor = .white
            self.lastLetterLabel.backgroundColor = .white
            
            
            // Reset label movements and their rotations back to how they were at the begining.
            self.lLabel.transform = CGAffineTransform.identity
            self.aLabel.transform = CGAffineTransform.identity
            self.mLabel.transform = CGAffineTransform.identity
            self.bLabel.transform = CGAffineTransform.identity
            self.dLabel.transform = CGAffineTransform.identity
            self.lastLetterLabel.transform = CGAffineTransform.identity
            
        }
    }
}

