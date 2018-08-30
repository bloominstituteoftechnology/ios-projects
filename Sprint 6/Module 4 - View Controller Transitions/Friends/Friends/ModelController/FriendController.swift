//
//  FriendController.swift
//  Friends
//
//  Created by Lisa Sampson on 8/30/18.
//  Copyright © 2018 Lisa Sampson. All rights reserved.
//

import UIKit

class FriendController {
    
    init() {
        let names: [String] = ["Lisa"]
        let images: [UIImage] = [#imageLiteral(resourceName: "lisaprof")]
        let jobs: [String] = ["iOS Student"]
        
        var index: Int = 0
        
        for _ in names {
            createFriend(withName: names[index], image: images[index], job: jobs[index])
            index += 1
        }
    }
    
    func createFriend(withName name: String, image: UIImage, job: String) {
        let friend = Friend(name: name, image: image, job: job)
        friends.append(friend)
        }
    
    var friends: [Friend] = []
}
