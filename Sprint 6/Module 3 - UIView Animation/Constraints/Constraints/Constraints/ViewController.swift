//
//  ViewController.swift
//  Constraints
//
//  Created by Sergey Osipyan on 1/16/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let greeenSquare = UIView()
        greeenSquare.backgroundColor = .green
        view.addSubview(greeenSquare)
        greeenSquare.translatesAutoresizingMaskIntoConstraints = false
        
        let greeenPurple = UIView()
        greeenPurple.backgroundColor = .purple
        view.addSubview(greeenPurple)
        greeenPurple.translatesAutoresizingMaskIntoConstraints = false
        
        let widthConstraint = NSLayoutConstraint(item: greeenSquare,
                                                 attribute: .width,
                                                 relatedBy: .equal,
                                                 toItem: nil,
                                                 attribute: .notAnAttribute,
                                                 multiplier: 1.0,
                                                 constant: 200.0)
        
        let heightConstraint = NSLayoutConstraint(item: greeenSquare,
                                                  attribute: .height,
                                                  relatedBy: .equal,
                                                  toItem: greeenSquare,
                                                  attribute: .width,
                                                  multiplier: 1.0,
                                                  constant: 0.0)
        
        let centerYConstraint = NSLayoutConstraint(item: greeenSquare,
                                                   attribute: .centerY,
                                                   relatedBy: .equal,
                                                   toItem: view,
                                                   attribute: .centerY,
                                                   multiplier: 1.0,
                                                   constant: 0.0)
        
        let centerXConstraint = NSLayoutConstraint(item: greeenSquare,
                                                   attribute: .centerX,
                                                   relatedBy: .equal,
                                                   toItem: view,
                                                   attribute: .centerX,
                                                   multiplier: 1.0,
                                                   constant: 0.0)
        
        
        NSLayoutConstraint.activate([heightConstraint, widthConstraint, centerXConstraint, centerYConstraint])
        
        
        
        let topConstraintgreeenPurple = NSLayoutConstraint(item: greeenPurple,
                                                 attribute: .top,
                                                 relatedBy: .equal,
                                                 toItem: greeenSquare,
                                                 attribute: .bottom,
                                                 multiplier: 1.0,
                                                 constant: 10.0)
        
        let widthConstraintgreeenPurple = NSLayoutConstraint(item: greeenPurple,
                                                  attribute: .width,
                                                  relatedBy: .equal,
                                                  toItem: greeenSquare,
                                                  attribute: .width,
                                                  multiplier: 1.0,
                                                  constant: 0.0)
        
        let bottomCConstraintgreeenPurple = NSLayoutConstraint(item: view,
                                                   attribute: .bottom,
                                                   relatedBy: .equal,
                                                   toItem: greeenPurple,
                                                   attribute: .bottom,
                                                   multiplier: 1.0,
                                                   constant: 10.0)
        
        let centerXConstraintgreeenPurple = NSLayoutConstraint(item: greeenPurple,
                                                   attribute: .centerX,
                                                   relatedBy: .equal,
                                                   toItem: view,
                                                   attribute: .centerX,
                                                   multiplier: 1.0,
                                                   constant: 0.0)
        
        NSLayoutConstraint.activate([widthConstraintgreeenPurple, topConstraintgreeenPurple , centerXConstraintgreeenPurple, bottomCConstraintgreeenPurple])
        
    }


}

