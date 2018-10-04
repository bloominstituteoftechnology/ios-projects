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
        startWelcomeAnimation()
    }

    @IBAction func shouldScramble(_ sender: Any) {
        let labels: [UILabel] = [l, a, m, b, d, secondA]
        animated ? resetLabels(labels: labels) : startLabelsAnimation(labels: labels)
        animated = !animated
    }
    
    var animated: Bool = false
    
    func startWelcomeAnimation() {
        var t = CGAffineTransform.identity
        t = t.translatedBy(x: 0, y: 40)
        t = t.rotated(by: -(CGFloat.pi / 8))
        t = t.scaledBy(x: 1.5, y: 1.5)
        
        UIView.animate(withDuration: 1.75, animations: {
            self.lambdaLogo.transform = t
        }) { (_) in
            UIView.animate(withDuration: 1, animations: {
                self.lambdaLogo.transform = .identity
            })
        }
    }
    
    
    func startLabelsAnimation(labels: [UILabel]){
        for label in labels {
            self.startAnimation(label: label)
        }
    }
    
    
    func resetLabels(labels: [UILabel]) {
        for label in labels {
            self.reset(label: label)
        }
    }
    
    func reset(label: UILabel) {
        UIView.animate(withDuration: 1) {
            self.resetIdentities(label: label)
            self.lambdaLogo.alpha = 1
            self.resetLabelsBackgroundColor(label: label)
        }
    }
    
    func resetIdentities(label: UILabel) {
        label.transform = .identity
    }
    
    func resetLabelsBackgroundColor(label: UILabel) {
        label.layer.backgroundColor = nil
    }
    
    func startAnimation(label: UILabel) {
        UIView.animate(withDuration: 0.8, animations: {
            self.changeLabelsBackgroundColor(label: label)
            self.moveLabels(label: label)
        }, completion: nil)
        UIView.animate(withDuration: 1) {
            self.lambdaLogo.alpha = 0
        }
    }

    func moveLabels(label: UILabel) {
        setValues(label: label)
    }
    
    func setValues(label: UILabel) {
        let height: Int = Int(self.view.frame.height)
        let width: Int = Int(self.view.frame.width)
        label.transform = CGAffineTransform.init(translationX: CGFloat(arc4random_uniform(UInt32(width/10))), y: CGFloat(arc4random_uniform(500))).rotated(by: CGFloat(arc4random_uniform(UInt32(height))))
    }
    
    func changeLabelsBackgroundColor(label: UILabel) {
        label.layer.backgroundColor = UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1).cgColor
    }
    
    
    @IBOutlet weak var l: UILabel!
    @IBOutlet weak var a: UILabel!
    @IBOutlet weak var m: UILabel!
    @IBOutlet weak var b: UILabel!
    @IBOutlet weak var d: UILabel!
    @IBOutlet weak var secondA: UILabel!
    
    @IBOutlet weak var lambdaLogo: UIImageView!
    
    
}

