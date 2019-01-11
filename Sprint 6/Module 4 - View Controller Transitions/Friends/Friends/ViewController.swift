//
//  ViewController.swift
//  Friends
//
//  Created by Austin Cole on 1/10/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    var friend: Friend?
    
    @IBOutlet weak var friendImageView: UIImageView!
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var friendOccupation: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let friend = friend else {return}
        friendImageView.image = friend.image
        friendName.text = friend.name
        friendOccupation.text = friend.occupation
    }


}

