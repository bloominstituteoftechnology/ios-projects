//
//  FriendsDetailViewController.swift
//  FriendsTransitions
//
//  Created by Benjamin Hakes on 1/10/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

import UIKit

class FriendsDetailViewController: UIViewController {

    var friend: Friend?
    var delegate: NavigationControllerDelegate?
    
    @IBOutlet weak var headshotImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
