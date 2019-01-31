//
//  DetailViewController.swift
//  Friends
//
//  Created by Jocelyn Stuart on 1/31/19.
//  Copyright © 2019 JS. All rights reserved.
//

import UIKit

class DetailViewController: ContentProvidingVC, UIViewControllerTransitioningDelegate {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        <#code#>
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    let animator = Animator()
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
}
