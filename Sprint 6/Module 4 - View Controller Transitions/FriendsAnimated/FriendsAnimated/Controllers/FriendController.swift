//
//  FriendController.swift
//  FriendsAnimated
//
//  Created by Angel Buenrostro on 1/31/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

import UIKit

class FriendController{
    
    var friends: [Friend] = []
    
    init() {
        friends.append(makeFriend(name: "Mushroom Boy", image: UIImage(named: "MushroomBoy")!))
        friends.append(makeFriend(name: "Nebula", image: UIImage(named: "Nebula")!))
    }
    
    func makeFriend(name: String, image: UIImage) -> Friend{
        return Friend(name: name, image: image)
    }
}

