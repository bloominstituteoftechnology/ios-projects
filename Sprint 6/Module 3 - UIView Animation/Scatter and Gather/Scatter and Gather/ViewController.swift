//
//  ViewController.swift
//  Scatter and Gather
//
//  Created by Moses Robinson on 1/30/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // stack view
        let stackView = UIStackView()
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 6
        
        // labels
        for letter in lambda {
            let label = UILabel()
            view.addSubview(label)
            label.text = String(letter)
            label.font = UIFont.boldSystemFont(ofSize: 60)
            label.textAlignment = .center
            
            labels.append(label)
            stackView.addArrangedSubview(label)
        }
        
        // lambda logo imageView
        let lambdaLogo = UIImageView()
        view.addSubview(lambdaLogo)
        lambdaLogo.translatesAutoresizingMaskIntoConstraints = false
        lambdaLogo.image = UIImage(named: "Lambda_Logo_Full")
        lambdaLogo.contentMode = .scaleAspectFit
        
        
        // constraints to `stackview` and `imageview`
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            lambdaLogo.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            lambdaLogo.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            lambdaLogo.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 30)
            ])
    }
    
    @IBAction func toggle(_ sender: Any) {
        shouldScramble.toggle()
        
    }
    
    // MARK: - Properties
    
    var shouldScramble: Bool = false
    let lambda = "Lambda"
    var labels: [UILabel] = []

}

