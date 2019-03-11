//
//  Camera.swift
//  Astronomy-ObjC
//
//  Created by TuneUp Shop  on 3/4/19.
//  Copyright © 2019 jkaunert. All rights reserved.
//

import Foundation

class Camera {
    
    let id: Int
    let name: String
    let roverId: Int
    let fullName: String
    
    init(id: Int, name: String, roverId: Int, fullName: String){
        self.id = id
        self.name = name
        self.roverId = roverId
        self.fullName = fullName
    }
}
