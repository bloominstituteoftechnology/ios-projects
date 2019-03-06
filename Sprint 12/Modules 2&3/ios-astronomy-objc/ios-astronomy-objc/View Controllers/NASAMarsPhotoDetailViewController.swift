//
//  NASAMarsPhotoDetailViewController.swift
//  ios-astronomy-objc
//
//  Created by Austin Cole on 3/5/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import UIKit

class NASAMarsPhotoDetailViewController: UIViewController {
    
    var data: Data?
    
    @IBOutlet weak var marsPhotoImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        marsPhotoImageView.image = UIImage(data: data!)
        
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
