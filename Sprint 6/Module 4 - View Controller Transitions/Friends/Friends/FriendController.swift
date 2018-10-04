//
//  FriendController.swift
//  Friends
//
//  Created by Moin Uddin on 10/4/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import Foundation
import UIKit

class FriendController {
    
    
    init() {
        createFriend(name: "Moin", occupation: "Software Developer", imageName: "Moin")
    }
    
    func createFriend(name: String, occupation: String, imageName: String) {
        let imageData = UIImage(named: imageName)!.pngData()!
        let friend = Friend(name: name, occupation: occupation, imageData: imageData)
        friends.append(friend)
    }
    
    
    private(set) var friends: [Friend] = []
    
}
