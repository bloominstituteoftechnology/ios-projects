//
//  FriendsTableViewCell.swift
//  Friends
//
//  Created by Jocelyn Stuart on 1/31/19.
//  Copyright © 2019 JS. All rights reserved.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    
    

}
