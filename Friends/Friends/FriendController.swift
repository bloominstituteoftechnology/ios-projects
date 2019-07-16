//
//  FriendController.swift
//  Friends
//
//  Created by Jocelyn Stuart on 1/31/19.
//  Copyright © 2019 JS. All rights reserved.
//

import UIKit

class FriendController {
    
    func createFriend(withName name: String, andDetails details: String, andPic profilePic: UIImage) {
        let friend = Friend(name: name, details: details, profilePic: profilePic)
        friends.append(friend)
    }
    
    var friends: [Friend] = []
    
}
