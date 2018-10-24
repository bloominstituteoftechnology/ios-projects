//
//  Friend.swift
//  Friends Animation
//
//  Created by Iyin Raphael on 10/4/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import Foundation
import UIKit

struct Friend: Equatable {
    
    var name: String
    var image: UIImage
    var details: String
    
    init(name: String, image: UIImage, details: String){
        self.name = name
        self.image = image
        self.details = details
    }
    
}
