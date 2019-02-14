//
//  PolarPoint.swift
//
//  Created by Andrew Madsen on 2/26/15.
//  Copyright (c) 2015 Open Reel Software. All rights reserved.
//

import Foundation
import UIKit

struct PolarPoint {
    
    var radius: CGFloat
    var theta: CGFloat
    
    init(radius: Int, theta: Int) {
        self.radius = CGFloat(radius)
        self.theta = CGFloat(theta)
    }
    
    init<T: BinaryFloatingPoint>(radius: T, theta: T) {
        self.radius = CGFloat(radius)
        self.theta = CGFloat(theta)
    }
    
    init(point: CGPoint, centerPoint: CGPoint) {
        let translatedPoint = CGPoint(x: point.x - centerPoint.x, y: point.y - centerPoint.y)
        let xDistance = abs(point.x - centerPoint.x)
        let yDistance = abs(point.y - centerPoint.y)
        
        self.radius = (pow(xDistance, 2.0) + pow(yDistance, 2.0)).squareRoot()
        self.theta = atan2(translatedPoint.y, translatedPoint.x)
    }
    
    static func degreesToRadians<T: BinaryFloatingPoint>(_ degrees: T) -> T {
        return degrees * T.pi / T(180.0)
    }
    
    static func radiansToDegrees<T: BinaryFloatingPoint>(_ radians: T) -> T {
        return radians * T(180.0) / T.pi
    }
}

extension CGPoint {
    init(polarPoint: PolarPoint, centerPoint: CGPoint) {
        let x = CGFloat(polarPoint.radius * cos(polarPoint.theta)) + centerPoint.x
        let y = CGFloat(polarPoint.radius * sin(polarPoint.theta)) + centerPoint.y
        self.init(x: x, y: y)
    }
}
