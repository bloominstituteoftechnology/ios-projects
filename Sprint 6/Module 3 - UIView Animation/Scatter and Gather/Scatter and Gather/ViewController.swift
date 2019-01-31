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
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            view.addSubview(label)
            label.text = String(letter)
            label.font = UIFont.boldSystemFont(ofSize: 60)
            label.textAlignment = .center
            
            labels.append(label)
            stackView.addArrangedSubview(label)
        }
        
        // lambda logo imageView
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
    
    private func generateRandomColor() -> UIColor {
        let hue : CGFloat = CGFloat(arc4random() % 256) / 256 // use 256 to get full range from 0.0 to 1.0
        let saturation : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from white
        let brightness : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from black
        
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
    
    @IBAction func toggle(_ sender: Any) {
        shouldScramble.toggle()
        
        if shouldScramble {
            
            UIImageView.animate(withDuration: 2) {
                self.lambdaLogo.alpha = 0
            }
            
            UILabel.animate(withDuration: 2) {
                for label in self.labels {
                    label.textColor = self.generateRandomColor()
                    label.backgroundColor = self.generateRandomColor()
                    
                    let randomRotation = CGFloat.pi / CGFloat(Int.random(in: 1...4))
                    let randomY = CGFloat(Int.random(in: 1...500))
                    let randomX = CGFloat(Int.random(in: -80...80))
                    
                    label.transform = CGAffineTransform.identity
                        .translatedBy(x: randomX, y: randomY)
                        .rotated(by: randomRotation)
                }
            }
        } else {
            
            UIImageView.animate(withDuration: 2) {
                self.lambdaLogo.alpha = 1
            }
            
            UILabel.animate(withDuration: 2) {
                for label in self.labels {
                    label.textColor = .black
                    label.backgroundColor = .clear
                    label.transform = .identity
                }
            }
        }
    }
    
    // MARK: - Properties
    
    var shouldScramble: Bool = false
    let lambda = "Lambda"
    var labels: [UILabel] = []
    let lambdaLogo = UIImageView()
    
}

