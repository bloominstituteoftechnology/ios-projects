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
        
        
    }
    
    // MARK: - Propeties
    
    var friendController: FriendController?
    var friend: Friend?
}
