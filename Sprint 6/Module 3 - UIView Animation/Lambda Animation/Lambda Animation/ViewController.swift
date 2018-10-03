//
//  ViewController.swift
//  Lambda Animation
//
//  Created by Iyin Raphael on 10/3/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
                                                  constant: 20)
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


    @IBAction func toggle(_ sender: Any) {
    }
    
    var shouldScramble: Bool = false 
}

