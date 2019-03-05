//
//  MarsRover.swift
//  ios-astronomy-objc
//
//  Created by Austin Cole on 3/4/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import Foundation

@objc
class MarsPhotoReference: NSObject {
    override init() {
        imgSrc = "Hellow, this is an initialized String."
        super.init()
        
    }

    
    @objc
    var imgSrc: String
}
