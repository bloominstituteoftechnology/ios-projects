//
//  SolDescription.swift
//  Objc Mars Rover
//
//  Created by Sergey Osipyan on 3/4/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

import UIKit

class SolDescription: NSObject, Codable {
    
        let sol: Int
        let totalPhotos: Int
        let cameras: [String]
    
    init(sol: Int, totalPhotos: Int, cameras: [String]) {
        self.sol = sol
        self.totalPhotos = totalPhotos
        self.cameras = cameras
    }
}
