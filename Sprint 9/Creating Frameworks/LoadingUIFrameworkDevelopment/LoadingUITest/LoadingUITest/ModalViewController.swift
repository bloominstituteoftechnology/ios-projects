//
//  ModalViewController.swift
//  LoadingUITest
//
//  Created by Ivan Caldwell on 2/14/19.
//  Copyright © 2019 Ivan Caldwell. All rights reserved.
//

import UIKit
import LoadingUI

class ModalViewController: LoadingViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
