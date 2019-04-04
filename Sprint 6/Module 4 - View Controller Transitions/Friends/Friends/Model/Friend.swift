//
//  Friend.swift
//  Friends
//
//  Created by Moses Robinson on 1/31/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

import UIKit

struct Friend {
    
    let name: String
    let image: UIImage
    let info = "Kingdom Hearts III Character"
    
    init(name: String, image: UIImage) {
        (self.name, self.image) = (name, image)
    }
}
