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
        navigationItem.title = "Hello!"
        view.addSubview(lambdaLogoImage)
        lambdaLogoImage.translatesAutoresizingMaskIntoConstraints = false
    }
    
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
    
    let randColor: [UIColor] = [.red, .blue, .purple, .orange, .lightGray, .orange, .green, .brown, .yellow]
    
    var shouldScramble: Bool = true
    var LPosition: CGRect = UILabel().frame
    var aPosition: CGRect = UILabel().frame
    var mPosition: CGRect = UILabel().frame
    var bPosition: CGRect = UILabel().frame
    var dPosition: CGRect = UILabel().frame
    var lastAPosition: CGRect = UILabel().frame
    var labelsArray: [UILabel] = []
    
    func animation() {
        
        let labelArray: [UILabel] = [L, a, m, b, d, lastA]
        labelsArray = labelArray
        LPosition = L.frame
        aPosition = a.frame
        mPosition = m.frame
        bPosition = b.frame
        dPosition = d.frame
        lastAPosition = lastA.frame
        for label in labelArray {
            let randCGFloatX = CGFloat.random(in: 0...340)
            let randCGFloatY = CGFloat.random(in: 0...650)
            let rect = CGRect(x: randCGFloatX, y: randCGFloatY, width: 50, height: 50)
            UIView.animate(withDuration: 3) {
            label.textColor = self.randColor[self.randomInt(min: 0, max: 8)].withAlphaComponent(1.0)
            label.backgroundColor = self.randColor[self.randomInt(min: 0, max: 8)].withAlphaComponent(0.3)
            label.frame = rect
            label.transform = CGAffineTransform(scaleX: CGFloat(self.randomInt(min: 1, max: 4)), y: CGFloat(self.randomInt(min: 1, max: 4)))
            label.transform = CGAffineTransform(rotationAngle: CGFloat(self.randomInt(min: 1, max: 350)))
            self.lambdaLogoImage.alpha = 0
                }
        }
    }
    func reset() {
        for label in labelsArray {
        
        UIView.animate(withDuration: 3) {
        label.textColor = .black
        label.backgroundColor = UIColor.white.withAlphaComponent(0)
        self.L.transform = .identity
        self.a.transform = .identity
        self.m.transform = .identity
        self.b.transform = .identity
        self.d.transform = .identity
        self.lastA.transform = .identity

        self.L.frame = self.LPosition
        self.a.frame = self.aPosition
        self.m.frame = self.mPosition
        self.b.frame = self.bPosition
        self.d.frame = self.dPosition
        self.lastA.frame = self.lastAPosition
        self.lambdaLogoImage.alpha = 1.0
        self.lambdaLogoImage.transform.inverted()
        }
        }
    }
}

