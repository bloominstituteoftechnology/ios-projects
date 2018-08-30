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

        guard let friends = friends else { return }
        nameLabel.text = friends.name

    }

    @IBOutlet weak var nameLabel: UILabel!

    var friends: Friend? {
        didSet {
            updateViews()
        }
    }

}
