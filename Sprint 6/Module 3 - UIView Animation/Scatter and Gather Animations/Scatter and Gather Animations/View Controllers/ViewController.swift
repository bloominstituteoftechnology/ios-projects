//
//  ViewController.swift
//  Scatter and Gather Animations
//
//  Created by Ivan Caldwell on 1/9/19.
//  Copyright © 2019 Ivan Caldwell. All rights reserved.
//

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
    lazy var yLocation = letter1.center.y
    lazy var xLocation = letter1.center.x
    lazy var letterWidth = letter1.frame.width
    lazy var letterHeight = letter1.frame.height
    lazy var maxWidth = view.frame.width
    lazy var maxHeight = view.frame.height
    lazy var labelArray = [letter1, letter2, letter3, letter4, letter5, letter6]
    
    // Actions
    @IBAction func toggle(_ sender: UIBarButtonItem) {
        if shouldScramble {
            //letter1!.center.x = xLocation
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
                    letter!.center.x = self.letterWidth / 2 + letterDistance
                    letter!.center.y = self.letterHeight / 2
                    letter!.backgroundColor = .white
                    letterDistance += self.letterWidth
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
        let number = Float.random(in: Float(0 + letterWidth / 2) ... Float(maxWidth - letterWidth / 2))
        return CGFloat(number)
    }
    
    func getRandomLocationY() -> CGFloat {
        let number = Float.random(in: Float(-maxHeight / 3) ... Float(maxHeight / 2))
        return CGFloat(number)
    }
}
