//
//  FriendTableViewCell.swift
//  Friends
//
//  Created by Moin Uddin on 10/4/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateViews() {
        guard let friend = friend else {
            return
        }
        friendImageView.image = UIImage(data: friend.imageData)
        friendNameLabel.text = friend.name
    }
    
    @IBOutlet weak var friendImageView: UIImageView!
    @IBOutlet weak var friendNameLabel: UILabel!
    
    
    
    var friend: Friend? {
        didSet {
            updateViews()
        }
    }

}
