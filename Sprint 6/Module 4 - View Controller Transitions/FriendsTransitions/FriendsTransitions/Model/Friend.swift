//
//  Friend.swift
//  FriendsTransitions
//
//  Created by Benjamin Hakes on 1/10/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

import Foundation
import UIKit


class Model {
    
    static let shared = Model()
    private init() {}
    
    var friends: [Friend] = [
        
        Friend(name: "Austin", title: "Chief", picture: UIImage(named: "Austin")!),
        Friend(name: "Andrew", title: "Head of iOS", picture: UIImage(named: "Andrew")!),
        Friend(name: "Caleb", title: "Head of Learning", picture: UIImage(named: "Caleb")!),
        Friend(name: "Trevor", title: "Head of Finance", picture: UIImage(named: "Trevor")!),
        Friend(name: "Karen", title: "Head of Admissions", picture: UIImage(named: "Karen")!)
    ]
}


struct Friend {
    
    let name: String
    let title: String
    let picture: UIImage
    
    init (name: String, title: String, picture: UIImage){
        self.name = name
        self.title = title
        self.picture = picture
    }
}
