//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Angel Buenrostro on 1/30/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var shouldScramble : Bool = false
    
    @IBAction func toggleButtonTapped(_ sender: Any) {
        shouldScramble = !shouldScramble
        
        if shouldScramble {
            // scramble the letters
        } else {
            // revert scrambling
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let charL = UILabel()
        charL.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(charL)
        charL.text = "L"
        let font = UIFont(name: "Avenir-Black", size: 40)!
        charL.font = font
        
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        stackView.addArrangedSubview(charL)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
            ])
        
        
        
    }


}

