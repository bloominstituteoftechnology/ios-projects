//
//  FriendDetailViewController.swift
//  Friends Animation
//
//  Created by Iyin Raphael on 10/4/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit

class FriendDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    
    func updateView(){
        guard isViewLoaded else {return}
        
        imageView.image = friendController.friend.image
        nameLabel.text = friendController.friend.name
        textView.text = friendController.friend.details
        
    }
    
    
    let friendController = FriendController()
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var textView: UITextView!
    

}
