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
  
    
    
    @IBAction func toggle(_ sender: Any) {
    
        if shouldScramble {
           animation()
        } else {
            reset()
        }
        shouldScramble = !shouldScramble
    }
    
    func randomInt(min: Int, max: Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
    
    
    let randColor: [UIColor] = [.red, .blue, .lightGray, .black, .green, .yellow]
    
    func randomColor() -> UIColor {
        for color in randColor {
        
    }
    
    var LPosition: CGRect = UILabel().frame
    var aPosition: CGRect = UILabel().frame
    var mPosition: CGRect = UILabel().frame
    var bPosition: CGRect = UILabel().frame
    var dPosition: CGRect = UILabel().frame
    var lastAPosition: CGRect = UILabel().frame
    
    
    
    
    func animation() {
        
        let labelArray: [UILabel] = [L, a, m, b, d, lastA]
        LPosition = L.frame
        aPosition = a.frame
        mPosition = m.frame
        bPosition = b.frame
        dPosition = d.frame
        lastAPosition = lastA.frame
        lambdaLogoImage.transform.inverted()
        for label in labelArray {
            let randCGFloatX = CGFloat.random(in: 60...240)
            let randCGFloatY = CGFloat.random(in: 150...650)
            let rect = CGRect(x: randCGFloatX, y: randCGFloatY, width: 50, height: 50)
            UIView.animate(withDuration: 5) {
            label.textColor = .black
            label.tintColor = .black
            label.frame = rect
            label.transform = CGAffineTransform(scaleX: CGFloat(self.randomInt(min: 1, max: 20)), y: CGFloat(self.randomInt(min: 1, max: 20)))
            label.transform = CGAffineTransform(rotationAngle: CGFloat(self.randomInt(min: -350, max: 350)))
           // label.bounds = rect
           
           //  var width = label.frame.size.width
           // self.L.transform = CGAffineTransform(rotationAngle: self.rondomAngel)
                }
            }
        
        }
    
    
    func reset() {
        
        UIView.animate(withDuration: 3) {
        self.L.frame = self.LPosition
        self.a.frame = self.aPosition
        self.m.frame = self.mPosition
        self.b.frame = self.bPosition
        self.d.frame = self.dPosition
        self.lastA.frame = self.lastAPosition
        }
        
    }
}

