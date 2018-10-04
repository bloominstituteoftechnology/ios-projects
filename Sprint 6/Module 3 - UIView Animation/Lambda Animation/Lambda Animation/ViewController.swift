//
//  ViewController.swift
//  Lambda Animation
//
//  Created by Iyin Raphael on 10/3/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
     let componentDimension: CGFloat = 40.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createLabel()
        
        let logoView = UIImageView()
        logoView.image = UIImage(named: "lambdaLogo.png")
        view.addSubview(logoView)
        logoView.translatesAutoresizingMaskIntoConstraints = false
    
        let viewCenterXConstraint = NSLayoutConstraint(item: logoView,
                                                       attribute: .centerX,
                                                       relatedBy: .equal,
                                                       toItem: view,
                                                       attribute: .centerX,
                                                       multiplier: 1,
                                                       constant: 0)
        
        let viewTopConstraint = NSLayoutConstraint(item: logoView,
                                                  attribute: .top,
                                                  relatedBy: .equal,
                                                  toItem: view.safeAreaLayoutGuide,
                                                  attribute: .top,
                                                  multiplier: 1,
                                                  constant: 150)
        let viewWidthConstraint = NSLayoutConstraint(item: logoView,
                                                     attribute: .width,
                                                     relatedBy: .equal,
                                                     toItem: nil,
                                                     attribute: .notAnAttribute,
                                                     multiplier: 1,
                                                     constant: 200)
        
        let viewHeightConstraint = NSLayoutConstraint(item: logoView,
                                                      attribute: .height,
                                                      relatedBy: .equal,
                                                      toItem: nil,
                                                      attribute: .notAnAttribute,
                                                      multiplier: 1,
                                                    constant: 200)
        
        NSLayoutConstraint.activate([viewCenterXConstraint,
                                     viewTopConstraint,
                                     viewWidthConstraint,
                                     viewHeightConstraint])
        
        
    }

    
    func createLabel() {
        
        let letter: String = "LAMBDA"
        var count: CGFloat = 0.0
        
        for char in letter {
            
            let space: CGFloat = (componentDimension * count) + (8.0 * count)
            
            
            let label = UILabel(frame: CGRect(x: space, y: 0.0, width: componentDimension, height: componentDimension))
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.text = String(char)
            label.textAlignment = .center
            view.addSubview(label)
            
            count = count + 1.0
            
            
        }
    }
    
    
    

    @IBAction func toggle(_ sender: Any) {
    }
    
    var shouldScramble: Bool = false 
}

