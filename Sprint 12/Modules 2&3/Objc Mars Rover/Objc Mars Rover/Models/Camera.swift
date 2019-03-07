//
//  Camera.swift
//  Astronomy
//
//  Created by Andrew R Madsen on 9/5/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class Camera: NSObject {
    let id: Int
    let name: String
    let roverId: Int
    let fullName: String
    
    @objc
    init(id: Int, roverId: Int, name: String, fullName: String) {
        self.id = id
        self.roverId = roverId
        self.name = name
        self.fullName = fullName
    }
}
