//
//  IntegerExtension.swift
//  LambdaScatter
//
//  Created by Benjamin Hakes on 1/9/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

import Foundation
import UIKit

extension Int {
    static func random() -> Int {
        return Int(CGFloat(arc4random()) / CGFloat(UInt32.max))
    }
}
