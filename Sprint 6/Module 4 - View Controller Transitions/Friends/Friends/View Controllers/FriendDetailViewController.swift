//
//  FriendDetailViewController.swift
//  Friends
//
//  Created by Moses Robinson on 1/31/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

import UIKit

class FriendDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    private func updateViews() {
        guard let friend = friend else { return }
        
        title = friend.name.capitalized
        friendImage.image = friend.image
        friendName.text = friend.name.capitalized
        friendInfo.text = friend.info
    }
    
    // MARK: - Propeties
    
    var friendController: FriendController?
    var friend: Friend?
    
    @IBOutlet weak var friendImage: UIImageView!
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var friendInfo: UILabel!
}
