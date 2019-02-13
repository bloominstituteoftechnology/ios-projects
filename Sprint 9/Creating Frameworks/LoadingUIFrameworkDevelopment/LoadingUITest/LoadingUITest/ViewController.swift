//
//  ViewController.swift
//  LoadingUITest
//
//  Created by Dillon McElhinney on 10/24/18.
//  Copyright © 2018 Dillon McElhinney. All rights reserved.
//

import UIKit
import LoadingUI

class ViewController: UIViewController {
    
    // MARK: - Properties
    var wheelDiameter: CGFloat = 200 {
        didSet {
            loadingViewController.wheelSize = wheelDiameter
            updateLabels()
        }
    }
    
    var wheelWeight: CGFloat = 30 {
        didSet {
            loadingViewController.wheelThickness = wheelWeight
            updateLabels()
        }
    }
    
    lazy var loadingViewController: LoadingViewController = {
        let loadingViewController = LoadingViewController()
        loadingViewController.backgroundColor = .black
        loadingViewController.wheelColor = .red
        loadingViewController.wheelSize = wheelDiameter
        loadingViewController.wheelThickness = wheelWeight
        return loadingViewController
    }()
    
    @IBOutlet weak var diameterLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        updateLabels()
    }
    
    // MARK: - UI Actions
    @IBAction func presentLoadingUI(_ sender: Any) {
        present(loadingViewController, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.loadingViewController.stop()
        }
    }
    
    @IBAction func setDiameter(_ sender: UISlider) {
        let diameter = Int(sender.value * 10) * 20 + 100
        wheelDiameter = CGFloat(diameter)
    }
    
    @IBAction func setWeight(_ sender: UISlider) {
        let weight = (Int(sender.value * 80) + 20) / 2
        wheelWeight = CGFloat(weight)
    }
    
    // MARK: - Utility Methods
    private func updateLabels() {
        weightLabel.text = "Weight: \(loadingViewController.wheelThickness)"
        diameterLabel.text = "Diameter: \(loadingViewController.wheelSize)"
    }
}

