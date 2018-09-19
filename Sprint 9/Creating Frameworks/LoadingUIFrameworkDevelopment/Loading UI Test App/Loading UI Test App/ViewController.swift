//
//  ViewController.swift
//  Loading UI Test App
//
//  Created by Lisa Sampson on 9/19/18.
//  Copyright © 2018 Lisa Sampson. All rights reserved.
//

import UIKit
import Loading_UI

class ViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToFrameworkLoader" {
            guard let destinationVC = segue.destination as? LoadingViewController else { return }
            destinationVC.startAnimation()
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                destinationVC.stopAnimation()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}

