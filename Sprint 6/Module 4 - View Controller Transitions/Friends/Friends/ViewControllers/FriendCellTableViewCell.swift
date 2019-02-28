//
//  FriendCellTableViewCell.swift
//  Friends
//
//  Created by De MicheliStefano on 30.08.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

import UIKit

class FriendCellTableViewCell: UITableViewCell {

    var friend: Friend? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    

    private func updateViews() {
        name?.text = friend?.name
        profileImage?.image = friend?.image
    }
    
}
