//
//  ViewController.swift
//  LambdaScatter
//
//  Created by Jocelyn Stuart on 1/30/19.
//  Copyright © 2019 JS. All rights reserved.
//

import UIKit

extension CGFloat {
    static func randomColor() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func randomColor() -> UIColor {
        return UIColor(red:   .randomColor(),
                       green: .randomColor(),
                       blue:  .randomColor(),
                       alpha: 1.0)
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var shouldToggle: Bool = true
    
    
    @IBAction func toggle(_ sender: UIBarButtonItem) {
        if shouldToggle == true {
            scatter()
            shouldToggle = false
        } else {
            gather()
            shouldToggle = true
        }
    }
    
    
    @IBOutlet weak var lambdaImageView: UIImageView!
    
    
    var labelArray: [UILabel] = []
    
    
    
    func setLabels() {
        var count: CGFloat = 0.0
        while labelArray.count <= 6 {
            count += 40.0
            var newLabel = UILabel(frame: CGRect(x: count, y: 100.0, width: 80, height: 80))
            
            if count == 40 {
                newLabel.text = "L"
            } else if count == (40*2){
                newLabel.text = "a"
            } else if count == (40*3){
                newLabel.text = "m"
            } else if count == (40*4){
                newLabel.text = "b"
            } else if count == (40*5) {
                newLabel.text = "d"
            } else if count == (40*6) {
                newLabel.text = "a"
            }
            newLabel.textAlignment = .center
            newLabel.font = UIFont(name: "Noteworthy", size: 60)
            
            labelArray.append(newLabel)
            newLabel.tag = Int(count)
            view.addSubview(newLabel)
          
        }
    }
    
    func scatter() {
      
        UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseOut, animations: {
            self.lambdaImageView.alpha = 0.0
         }, completion: nil)
        
        
        for letter in labelArray {
            let randX = CGFloat.random(in: 0 ..< 300)
            let randY = CGFloat.random(in: 100 ..< 550)
            let randRotation = CGFloat.random(in: 1 ..< 6)
            letter.textColor = .randomColor()
            letter.backgroundColor = .randomColor()
            
            UIView.animateKeyframes(withDuration: 4.0, delay: 0, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
                    letter.transform = CGAffineTransform(rotationAngle: CGFloat.pi/randRotation)
                })
                
                UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5, animations: {
                    letter.center = CGPoint(x: randX, y: randY)
                })
                
                
            }, completion: nil)
            
        }
        
    }
    
    func gather() {
        
        UIView.animate(withDuration: 2.0, delay: 0, options: .curveEaseIn, animations: {
            self.lambdaImageView.alpha = 1.0
        }, completion: nil)
    
        
        for letter in labelArray {
            letter.textAlignment = .center
            letter.textColor = .black
            letter.backgroundColor = .clear
           // print(letter.tag)
            
            UIView.animateKeyframes(withDuration: 3.0, delay: 0, options: [], animations: {
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
                    letter.transform = .identity
                })
                
                UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5, animations: {
                    letter.center = CGPoint(x: CGFloat(letter.tag), y: 100.0)
                })
                
                
            }, completion: nil)
        }
        
        
        
    }
    

}

