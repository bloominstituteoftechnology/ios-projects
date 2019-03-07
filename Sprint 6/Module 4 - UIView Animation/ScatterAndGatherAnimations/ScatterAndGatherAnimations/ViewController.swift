//
//  ViewController.swift
//  ScatterAndGatherAnimations
//
//  Created by Lisa Sampson on 8/29/18.
//  Copyright © 2018 Lisa Sampson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        labels = [lambdaL, lambdaAOne, lambdaM, lambdaB, lambdaD, lambdaATwo]
        
        view.addSubview(lambdaL)
        view.addSubview(lambdaAOne)
        view.addSubview(lambdaM)
        view.addSubview(lambdaB)
        view.addSubview(lambdaD)
        view.addSubview(lambdaATwo)
        view.addSubview(lambdaLogo)
    }

    @IBAction func toggle(_ sender: Any) {
        
        if shouldScramble == false {
            
            UIView.animate(withDuration: 3.0) {
                self.lambdaLogo.alpha = 0.0
                
                for label in self.labels {
                    let index = Int(arc4random_uniform(UInt32(self.colorArray.count)))
                    label.textColor = self.colorArray[index]
                    let backgroundIndex = Int(arc4random_uniform(UInt32(self.colorArray.count)))
                    label.layer.backgroundColor = self.colorArray[backgroundIndex].cgColor
                    label.scatter()
                }
            }
            shouldScramble = true
        } else {
            
            UIView.animate(withDuration: 3.0) {
                self.lambdaLogo.alpha = 1.0
                
                for label in self.labels {
                    label.textColor = .black
                    label.layer.backgroundColor = UIColor.clear.cgColor
                    label.gather()
                }
            }
            shouldScramble = false
        }
    }
    
    var shouldScramble: Bool = false
    let colorArray = [UIColor.red, UIColor.orange, UIColor.blue, UIColor.cyan, UIColor.purple, UIColor.green, UIColor.magenta, UIColor.yellow]
    
    private var labels: [UILabel] = []

    @IBOutlet weak var lambdaL: UILabel!
    @IBOutlet weak var lambdaAOne: UILabel!
    @IBOutlet weak var lambdaM: UILabel!
    @IBOutlet weak var lambdaB: UILabel!
    @IBOutlet weak var lambdaD: UILabel!
    @IBOutlet weak var lambdaATwo: UILabel!
    @IBOutlet weak var lambdaLogo: UIImageView!
    
}

extension UIView {
    
    func scatter() {
        let translate = CGAffineTransform(translationX: CGFloat(arc4random_uniform(UInt32(superview?.bounds.width ?? 300))) - frame.minX, y: CGFloat(arc4random_uniform(UInt32(superview?.bounds.height ?? 300))) - frame.minY)
        transform = translate.rotated(by: CGFloat(arc4random_uniform(361)) / CGFloat.pi*2).scaledBy(x: 1.6, y: 1.6)
    }
    
    func gather() {
        transform = .identity
    }
    
}

