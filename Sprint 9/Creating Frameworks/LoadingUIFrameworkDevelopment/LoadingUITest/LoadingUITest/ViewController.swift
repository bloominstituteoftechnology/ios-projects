//
//  ViewController.swift
//  LoadingUITest
//
//  Created by Moin Uddin on 10/24/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import UIKit
import LoadingUI
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        animateButtonLabel.center = view.convert(view.center, from: view.superview)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Loading" {
            guard let loadingView = segue.destination as? LoadingViewController else { return }
            loadingView.startAnimation()
        }
    }

    @IBOutlet weak var animateButtonLabel: UIButton!
    
}

