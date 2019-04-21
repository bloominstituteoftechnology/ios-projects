//
//  ViewController.swift
//  LoadingUITest
//
//  Created by Iyin Raphael on 10/24/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit
import LoadingUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loading"{
            let destinationVC = segue.destination as! LoadingViewController
            destinationVC.startAnimation()
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                destinationVC.dismiss(animated: true){}
            }
        }
    }


}

