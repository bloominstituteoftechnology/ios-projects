//
//  ViewController.swift
//  Constraints
//
//  Created by Sergey Osipyan on 1/10/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var widthConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let greenSquare = UIView()
        greenSquare.translatesAutoresizingMaskIntoConstraints = false
        greenSquare.backgroundColor = .green
       
        view.addSubview(greenSquare)
        
        // y = mx + b
        
        let centerXConstraint = NSLayoutConstraint(item: greenSquare, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0)
        
        
        let centerYConstraint = NSLayoutConstraint(item: greenSquare, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0)
       
        widthConstraint = NSLayoutConstraint(item: greenSquare, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200)
        
        let heightConstraint = NSLayoutConstraint(item: greenSquare, attribute: .height, relatedBy: .equal, toItem: greenSquare, attribute: .width, multiplier: 1, constant: 0)
        
        let animateButton = UIButton()
        animateButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animateButton)
        animateButton.addTarget(self, action: #selector(animateButtonTapped(_:)), for: .touchUpInside)
        animateButton.setTitle("Animate", for: .normal)
        animateButton.setTitleColor(.blue, for: .normal)
        
        let buttonCenterConstraint = animateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let buttonBottomConstraint = animateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        
        NSLayoutConstraint.activate([centerXConstraint, centerYConstraint, widthConstraint, heightConstraint, buttonBottomConstraint, buttonCenterConstraint])
    }


    @objc func animateButtonTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 3) {
            self.widthConstraint.constant = 300
            self.view.layoutIfNeeded()
        }
        
    }
    
    
}

