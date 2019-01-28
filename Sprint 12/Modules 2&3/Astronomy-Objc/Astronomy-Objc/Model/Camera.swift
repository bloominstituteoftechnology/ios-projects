//
//  Model.swift
//  Astronomy-Objc
//
//  Created by Nikita Thomas on 1/28/19.
//  Copyright © 2019 Nikita Thomas. All rights reserved.
//

import Foundation

@objc class Camera: NSObject, Codable {
    
    static func == (lhs: Camera, rhs: Camera) -> Bool {
        return lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.roverId == rhs.roverId &&
            lhs.fullName == rhs.fullName
    }
    
    let id: Int
    let name: String
    let roverId: Int
    let fullName: String
}
