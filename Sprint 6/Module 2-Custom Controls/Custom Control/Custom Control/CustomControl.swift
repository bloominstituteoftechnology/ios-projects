//
//  CustomControl.swift
//  Custom Control
//
//  Created by Jeremy Taylor on 8/28/18.
//  Copyright © 2018 Bytes-Random L.L.C. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    var value = 1
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
