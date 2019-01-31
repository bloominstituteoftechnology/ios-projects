//
//  Friends.swift
//  FriendsAnimated
//
//  Created by Angel Buenrostro on 1/31/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

import UIKit

struct Friend {
    let name : String
    let image : UIImage
    let detail : String
    
    init(name : String, image : UIImage, detail : String) {
        self.name = name
        self.image = image
        self.detail = detail
    }
}
