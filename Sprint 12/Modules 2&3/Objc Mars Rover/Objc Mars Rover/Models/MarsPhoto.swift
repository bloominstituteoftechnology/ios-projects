//
//  MarsPhoto.swift
//  Astronomy
//
//  Created by Andrew R Madsen on 9/5/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class MarsPhotoReference: NSObject {
    let id: Int
    let sol: Int
    let camera: Camera
    let earthDate: Date
    
    let imageURL: URL
    
    init(id: Int, sol: Int, camera: Camera, earthDate: Date, imageURL: URL) {
        self.id = id
        self.sol = sol
        self.camera = camera
        self.earthDate = earthDate
        self.imageURL = imageURL
    }

}

