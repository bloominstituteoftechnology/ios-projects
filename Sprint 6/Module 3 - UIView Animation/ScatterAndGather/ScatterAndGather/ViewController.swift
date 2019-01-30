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
        let font = UIFont(name: "Avenir-Black", size: 40)!
        
        let charL = UILabel()
        charL.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(charL)
        charL.text = "L"
        charL.font = font
        
        let charA = UILabel()
        charA.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(charA)
        charA.text = "A"
        charA.font = font
        
        let charM = UILabel()
        charM.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(charM)
        charM.text = "M"
        charM.font = font
        
        let charB = UILabel()
        charB.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(charB)
        charB.text = "B"
        charB.font = font
        
        let charD = UILabel()
        charD.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(charD)
        charD.text = "D"
        charD.font = font
        
        let charA2 = UILabel()
        charA2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(charA)
        charA2.text = "A"
        charA2.font = font
        
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        stackView.addArrangedSubview(charL)
        stackView.addArrangedSubview(charA)
        stackView.addArrangedSubview(charM)
        stackView.addArrangedSubview(charB)
        stackView.addArrangedSubview(charD)
        stackView.addArrangedSubview(charA2)
        
        
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.90),
            stackView.centerXAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.centerXAnchor, multiplier: 1)
            ])
        
        
        
    }


}

