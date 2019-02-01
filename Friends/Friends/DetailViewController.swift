//
//  DetailViewController.swift
//  Friends
//
//  Created by Jocelyn Stuart on 1/31/19.
//  Copyright © 2019 JS. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        if let friend = friend {
            nameLabel.text = friend.name
            profileImage.image = friend.profilePic
            detailLabel.text = friend.details
        }
        // Do any additional setup after loading the view.
    }
    
  
    var friend: Friend?
    
    let animator = Animator()
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
}
