//
//  ViewController.swift
//  Scatter and Gather Animations
//
//  Created by Ivan Caldwell on 1/9/19.
//  Copyright © 2019 Ivan Caldwell. All rights reserved.
//
extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}

import UIKit

class ViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var lambdaLogo: UIImageView!
    @IBOutlet weak var letter1: UILabel!
    @IBOutlet weak var letter2: UILabel!
    @IBOutlet weak var letter3: UILabel!
    @IBOutlet weak var letter4: UILabel!
    @IBOutlet weak var letter5: UILabel!
    @IBOutlet weak var letter6: UILabel!
    
    // View Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // Variables and Constants
    var shouldScramble: Bool = true
    
    // I don't understand lazy vs. strong vs. etc...
    // I'm storing the orignal location of the letters
    // so I can gather them after scatter...
    lazy var yLocation = letter1.center.y
    lazy var xLocation1 = letter1.center.x
    lazy var xLocation2 = letter2.center.x
    lazy var xLocation3 = letter3.center.x
    lazy var xLocation4 = letter4.center.x
    lazy var xLocation5 = letter5.center.x
    lazy var xLocation6 = letter6.center.x
    lazy var letterWidth = letter1.frame.width
    lazy var letterHeight = letter1.frame.height
    lazy var maxWidth = view.bounds.width - letterWidth
    lazy var maxHeight = view.bounds.height - letterHeight
    lazy var labelArray = [letter1, letter2, letter3, letter4, letter5, letter6]
    
    
    // Actions
    @IBAction func toggle(_ sender: UIBarButtonItem) {
        if !shouldScramble {
            for letter in labelArray {
                UIView.animate(withDuration: 0.5) {
                    self.lambdaLogo.alpha = 0.0
                    letter!.center.x = self.getRandomLocationX()
                    letter!.center.y = self.getRandomLocationY()
                    letter!.backgroundColor = self.getRandomColor()
                    
                }
            }
        } else {
            lambdaLogo.alpha = 1.0
            var letterDistance: CGFloat = 0
            for letter in labelArray {
                UIView.animate(withDuration: 0.5) {
                    letter!.center.x = self.xLocation1 + letterDistance
                    letter!.center.y = self.yLocation
                    letter!.backgroundColor = .white
                    letterDistance += self.letterWidth
                }
            }
        }
        toggle()
    }
    
    
    

    // Functions
    func toggle() {
        shouldScramble = !shouldScramble
    }
    
    func getRandomColor() -> UIColor {
        //Generate between 0 to 1
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
    
    func getRandomLocationX() -> CGFloat {
        let number = Float.random(in: 0 ... Float(maxWidth))
        return CGFloat(number)
    }
    
    func getRandomLocationY() -> CGFloat {
        let number = Float.random(in: 0 ... Float(maxHeight))
        return CGFloat(number)
    }
//    func getLetterAtIndex (str: String, location: Int) -> String {
//        let index = str.index(str.startIndex, offsetBy: location)
//        return String(str[index])
//    }
    
    
}

