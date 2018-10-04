//
//  FriendDetailViewController.swift
//  Friends
//
//  Created by Dillon McElhinney on 10/4/18.
//  Copyright © 2018 Dillon McElhinney. All rights reserved.
//

import UIKit

class FriendDetailViewController: UIViewController {

    var friend: Friend?
    
    @IBOutlet weak var friendImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    private func updateViews() {
        guard let friend = friend, isViewLoaded else { return }
        
        title = friend.name
        nameLabel.text = friend.name
        descriptionLabel.text = friend.description
        
        if let imageData = friend.imageData {
            friendImageView.image = UIImage(data: imageData)
        }
    }

}
