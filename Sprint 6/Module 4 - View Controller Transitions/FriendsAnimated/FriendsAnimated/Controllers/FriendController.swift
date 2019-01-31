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
        friends.append(makeFriend(name: "Mushroom Boy", image: UIImage(named: "MushroomBoy")!, detail: "Rare plant-based humanoid."))
        friends.append(makeFriend(name: "Nebula", image: UIImage(named: "Nebula")!, detail: "Whirling space vortex!"))
    }
    
    func makeFriend(name: String, image: UIImage, detail: String) -> Friend{
        return Friend(name: name, image: image, detail: detail)
    }
}

