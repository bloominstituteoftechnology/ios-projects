//
//  ViewController.swift
//  Friends
//
//  Created by Ivan Caldwell on 1/17/19.
//  Copyright © 2019 Ivan Caldwell. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {

    var friend: Friend?
    
    @IBOutlet weak var friendImage: UIImageView!
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var friendTitle: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        friendName.text = friend?.name
        friendTitle.text = friend?.title
        friendImage.image = friend?.image
    }
}

