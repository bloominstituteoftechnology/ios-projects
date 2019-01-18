//
//  Friend.swift
//  Friends
//
//  Created by Ivan Caldwell on 1/17/19.
//  Copyright © 2019 Ivan Caldwell. All rights reserved.
//

import Foundation
import UIKit

struct Friend {
    var name: String
    var title: String
    var image: UIImage
    
    init(name: String, title: String, image: UIImage) {
        self.name = name
        self.title = title
        self.image = image
    }
}
