//
//  FriendsTableViewCell.swift
//  FriendsAnimated
//
//  Created by Angel Buenrostro on 1/31/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {
    
    var friend: Friend? {
        didSet{
            updateViews()
        }
    }

    @IBOutlet weak var friendImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateViews(){
        guard let friend = friend else { return }
        nameLabel.text = friend.name
        friendImage.image = friend.image
        print("friend is : \(friend)")
    }

}
