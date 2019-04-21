//
//  FriendController.swift
//  Friends Animation
//
//  Created by Iyin Raphael on 10/4/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit

let demiImage: UIImage = UIImage(named: "daughter.jpg")!
let demiName: String = "Demilade"
let demiDetail: String = "My Beautiful Daughter"

class FriendController {
    
    
    var friend = Friend(name: demiName, image: demiImage, details: demiDetail)
    lazy var friends: [Friend] = [friend]
}
