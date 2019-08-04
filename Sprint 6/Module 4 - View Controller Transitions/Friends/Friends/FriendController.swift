//
//  FriendController.swift
//  Friends
//
//  Created by Daniela Parra on 10/4/18.
//  Copyright © 2018 Daniela Parra. All rights reserved.
//

import UIKit

class FriendController {
    
    init() {
        let isInitiated = UserDefaults.standard.bool(forKey: "isInitiated")
        if !isInitiated {
            makeFriends()
        } else {
            makeFriends()
        }
    }
    
    func makeFriends() {
        for friendIndex in 0...friendsName.count - 1 {
            let imageName = friendsName[friendIndex].lowercased()
            let image = UIImage(named: imageName)
            guard let imageData = image?.pngData() else { return }
            
            _ = Friend(name: friendsName[friendIndex], bio: friendsBio[friendIndex], image: imageData)
        }
        UserDefaults.standard.set(true, forKey: "isInitiated")
        
    }
    
    var friendsName: [String] = ["Chandler", "Joey", "Monica", "Phoebe", "Rachel", "Ross"]
    var friendsBio: [String] = ["Ross's College Friend", "Eternal Bachelor", "Obsessively Clean Chef", "Free Spirit", "A Hot Mess", "Always the Divorceé"]
}
