//
//  LoadingViewController.swift
//  LoadingUI
//
//  Created by TuneUp Shop  on 2/13/19.
//  Copyright © 2019 jkaunert. All rights reserved.
//

import UIKit

open class LoadingViewController: UIViewController {

    let IMAGE_SIZE: CGFloat = 100
    let OFFSET: CGFloat = 0
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        let loader = IndeterminateLoadingView(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0))
        self.view.addSubview(loader)
        
        //FIXME: - add constraints here
        loader.center = self.view.center
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.widthAnchor.constraint(equalToConstant: IMAGE_SIZE).isActive = true
        loader.heightAnchor.constraint(equalToConstant: IMAGE_SIZE).isActive = true
        loader.centerXAnchor.constraint(lessThanOrEqualTo: self.view.centerXAnchor).isActive = true
        loader.centerYAnchor.constraint(lessThanOrEqualTo: self.view.centerYAnchor, constant: OFFSET).isActive = true

        loader.startAnimating()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func dismissModal(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
