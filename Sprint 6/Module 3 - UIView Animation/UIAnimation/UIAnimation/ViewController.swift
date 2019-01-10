//
//  ViewController.swift
//  UIAnimation
//
//  Created by Sergey Osipyan on 1/9/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
   
        view.addSubview(lambdaLogoImage)
        
        L.translatesAutoresizingMaskIntoConstraints = false
        lambdaLogoImage.translatesAutoresizingMaskIntoConstraints = false
        

    }
    
    var shouldScramble: Bool = true
    
    @IBOutlet weak var stack: UIStackView!
    @IBOutlet weak var L: UILabel!
    @IBOutlet weak var a: UILabel!
    @IBOutlet weak var m: UILabel!
    @IBOutlet weak var b: UILabel!
    @IBOutlet weak var d: UILabel!
    @IBOutlet weak var lastA: UILabel!
    @IBOutlet weak var lambdaLogoImage: UIImageView!
  
    @IBOutlet weak var barButton: UIBarButtonItem!
    
    @IBAction func toggle(_ sender: Any) {
    
      animation()
        shouldScramble = !shouldScramble
    }
    
    
   let numbers = Int.random(in: -250 ... 250)
    
    
    
    
    func animation() {
        let rect = CGRect(x: numbers, y: numbers, width: 50, height: 50)
        let labelArray: [UILabel] = [L, a, m, b, d, lastA]
        let point: CGPoint = CGPoint(x: 8, y: 85)
        
        let size: CGSize = CGSize(width: 53, height: 49)
        for label in labelArray {
        
            if shouldScramble == true {
            
            UIView.animate(withDuration: 3) {
            label.textColor = .white
            label.tintColor = .black
              
           // label.bounds = rect
                self.stack.layer.frame = CGRect(x: self.numbers, y: self.numbers, width: 50, height: 50)
            label.backgroundColor = .red
            
                
                
                
          //  var width = label.frame.size.width
           // self.L.transform = CGAffineTransform(rotationAngle: self.rondomAngel)
            
            }
            } else {
                
                label.backgroundColor = .white
                label.textColor = .black
                stack.frame = CGRect(origin: point, size: size)
               // stack.transform = CGAffineTransform(translationX: CGFloat(8), y: CGFloat(72))
                
            }
        }
    }
}

