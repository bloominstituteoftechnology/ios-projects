//
//  ViewController.swift
//  Scatter and Gather Animations
//
//  Created by Moin Uddin on 10/3/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func shouldScramble(_ sender: Any) {
        if animated {
            self.reset()
        } else {
            self.startAnimation()
        }
        animated = !animated

    }
    
    var animated: Bool = false
    
    func reset() {
        UIView.animate(withDuration: 1) {
            self.resetIdentities()
            self.lambdaLogo.alpha = 1
            self.resetLabelsBackgroundColor()
        }
    }
    
    func resetIdentities() {
        self.l.transform = .identity
        self.a.transform = .identity
        self.m.transform = .identity
        self.b.transform = .identity
        self.d.transform = .identity
        self.secondA.transform = .identity
    }
    
    func resetLabelsBackgroundColor() {
        self.l.layer.backgroundColor = nil
        self.a.layer.backgroundColor = nil
        self.m.layer.backgroundColor = nil
        self.b.layer.backgroundColor = nil
        self.d.layer.backgroundColor = nil
        self.secondA.layer.backgroundColor = nil
    }
    
    func startAnimation() {
        UIView.animate(withDuration: 0.5, animations: {
            self.changeLabelsBackgroundColor()
            self.moveLabels()
            //self.rotateLabels()
        }, completion: nil)
        UIView.animate(withDuration: 1) {
            self.lambdaLogo.alpha = 0
        }
    }
    
//    func rotateLabels() {
//        l.transform = CGAffineTransform(rotationAngle: CGFloat(arc4random_uniform(360)) )
//        a.transform = CGAffineTransform(rotationAngle: CGFloat(arc4random_uniform(360)) )
//        m.transform = CGAffineTransform(rotationAngle: CGFloat(arc4random_uniform(360)) )
//        b.transform = CGAffineTransform(rotationAngle: CGFloat(arc4random_uniform(360)) )
//        d.transform = CGAffineTransform(rotationAngle: CGFloat(arc4random_uniform(360)) )
//        secondA.transform = CGAffineTransform(rotationAngle: CGFloat(arc4random_uniform(360)) )
//    }
    
    func moveLabels() {
        setValues(label: l)
        setValues(label: a)
        setValues(label: m)
        setValues(label: b)
        setValues(label: d)
        setValues(label: secondA)
    }
    
    func setValues(label: UILabel) {
        let height: Int = Int(self.view.frame.height)
        let width: Int = Int(self.view.frame.width)
        label.transform = CGAffineTransform.init(translationX: CGFloat(arc4random_uniform(UInt32(width/10))), y: CGFloat(arc4random_uniform(500))).rotated(by: CGFloat(arc4random_uniform(UInt32(height))))
    }
    
    //CGFloat(arc4random_uniform(35))
    
    func changeLabelsBackgroundColor() {
        self.l.layer.backgroundColor = UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1).cgColor
        self.a.layer.backgroundColor = UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1).cgColor
        self.m.layer.backgroundColor = UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1).cgColor
        self.b.layer.backgroundColor = UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1).cgColor
        self.d.layer.backgroundColor = UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1).cgColor
        self.secondA.layer.backgroundColor = UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1).cgColor
    }
    
    @IBOutlet weak var l: UILabel!
    @IBOutlet weak var a: UILabel!
    @IBOutlet weak var m: UILabel!
    @IBOutlet weak var b: UILabel!
    @IBOutlet weak var d: UILabel!
    @IBOutlet weak var secondA: UILabel!
    
    @IBOutlet weak var lambdaLogo: UIImageView!
    
    
}

