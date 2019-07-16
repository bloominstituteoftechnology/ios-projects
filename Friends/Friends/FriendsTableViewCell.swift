//
//  FriendsTableViewCell.swift
//  Friends
//
//  Created by Jocelyn Stuart on 1/31/19.
//  Copyright © 2019 JS. All rights reserved.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    private func updateViews() {
        guard let friend = friend else { return }
        nameLabel.text = friend.name
        profileImage.image = friend.profilePic
    }
    
    
    var friend: Friend? {
        didSet {
            updateViews()
        }
    }
}
    
    
    


