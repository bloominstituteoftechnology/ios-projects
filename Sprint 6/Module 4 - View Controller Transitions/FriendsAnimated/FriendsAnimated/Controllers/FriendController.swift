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
        friends.append(makeFriend(name: "Mushroom Psychic", image: UIImage(named: "MushroomBoy")!, detail: "Rare plant-based esper."))
        friends.append(makeFriend(name: "Nebula Wizard", image: UIImage(named: "Nebula")!, detail: "Whirling space vortex with magic tricks!"))
    }
    
    func makeFriend(name: String, image: UIImage, detail: String) -> Friend{
        return Friend(name: name, image: image, detail: detail)
    }
}

