//
//  TestLoadingViewController.swift
//  FrameWorkProject
//
//  Created by Ryan Murphy on 6/26/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import UIKit
import FrameWork

class TestLoadingViewController: UIViewController {

    
    @IBOutlet weak var LoadingView: IndeterminateLoadingView!
    
    @IBOutlet weak var EndButtonTapped: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        loadAnimation()
    }
    

    func loadAnimation() {
        
       LoadingView.startAnimating()
        
    }
    @IBAction func endButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    var loadingViewController = LoadingViewController()
    
var indetermLV = IndeterminateLoadingView()
}
