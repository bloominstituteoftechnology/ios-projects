//
//  FriendDetailViewController.swift
//  Friends
//
//  Created by Moin Uddin on 10/4/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import UIKit

class FriendDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func updateViews() {
        
        guard let friend = friend else { return }
        title = friend.name
        friendImageView.image = UIImage(data: friend.imageData)
        friendNameLabel.text = friend.name
        friendOccupationLabel.text = friend.occupation
    }
    
    @IBOutlet weak var friendImageView: UIImageView!
    @IBOutlet weak var friendNameLabel: UILabel!
    @IBOutlet weak var friendOccupationLabel: UILabel!
    
    var friend: Friend? {
        didSet {
            DispatchQueue.main.async {
                self.updateViews()
            }
        }
    }

}
