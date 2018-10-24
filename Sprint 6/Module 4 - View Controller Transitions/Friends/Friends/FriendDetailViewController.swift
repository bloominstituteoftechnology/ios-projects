//
//  FriendDetailViewController.swift
//  Friends
//
//  Created by Daniela Parra on 10/4/18.
//  Copyright © 2018 Daniela Parra. All rights reserved.
//

import UIKit

class FriendDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    private func updateViews() {
        guard let friend = friend else { return }
        
        guard let imageData = friend.image else { return }
        let image = UIImage(data: imageData)
        
        title = friend.name
        
        friendImageView.image = image
        nameLabel.text = friend.name
        bioLabel.text = friend.bio
        
    }
    
    var friendController: FriendController?
    var friend: Friend? {
        didSet {
            if isViewLoaded {
                updateViews()
            }
        }
    }
    
    @IBOutlet weak var friendImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    
}
