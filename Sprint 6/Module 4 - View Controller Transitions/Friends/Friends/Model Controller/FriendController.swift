//
//  FriendController.swift
//  Friends
//
//  Created by Moses Robinson on 1/31/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

import UIKit

class FriendController {
    
    init() {
        for name in friendNames {
            guard let image = UIImage(named: name) else { return }
            let friend = Friend(name: name, image: image)
            friends.append(friend)
        }
    }
    
    // Mark: - Properties
    
    private(set) var friends: [Friend] = []
    
    let friendNames = ["sora",
                       "donald",
                       "goofy",
                       "mickey",
                       "riku",
                       "kairi",
                       "elsa",
                       "anna",
                       "olaf",
                       "mike",
                       "sully",
                       "buzz",
                       "woody",
                       "aqua",
                       "terra",
                       "ventus"]
}
