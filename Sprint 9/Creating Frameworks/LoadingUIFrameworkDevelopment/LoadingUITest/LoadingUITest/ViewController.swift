//
//  ViewController.swift
//  LoadingUITest
//
//  Created by Jonathan Ferrer on 6/26/19.
//  Copyright © 2019 Jonathan Ferrer. All rights reserved.
//

import UIKit
import LoadingUI


class ViewController: LoadingViewController {

    

    override func viewDidLoad() {
        super.viewDidLoad()
        startLoading()

    }
    @IBAction func startButtonPressed(_ sender: Any) {

        startLoading()

    }

    @IBAction func stopButtonPressed(_ sender: Any) {

        finishedLoading()
    }

    @IBOutlet weak var startButton: UIBarButtonItem!
}

