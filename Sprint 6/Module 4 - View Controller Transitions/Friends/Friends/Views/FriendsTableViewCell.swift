//
//  FriendsTableViewCell.swift
//  Friends
//
//  Created by Lisa Sampson on 8/30/18.
//  Copyright © 2018 Lisa Sampson. All rights reserved.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    func updateViews() {

        guard let friend = friend else { return }
        nameLabel.text = friend.name
        cellImageView.image = friend.image
    }

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!
    
    var friend: Friend? {
        didSet {
            updateViews()
        }
    }

}
