//
//  CustomControl.swift
//  Custom UIControl
//
//  Created by Moses Robinson on 1/29/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    var value: Int = 1
    
    private let componentDimension: CGFloat = 40
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    var labels: [UILabel] = []
    
    private func setup() {
        
        var x: CGFloat = 8.0
        
        for component in 1...componentCount {
            
            let label = UILabel(frame: CGRect(x: x, y: 0, width: componentDimension, height: componentDimension))
            label.tag = component
            label.font = UIFont.boldSystemFont(ofSize: 32)
            label.text = "☃︎"
            label.textAlignment = .center
            if component == 1 {
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
            }
            
            x += componentDimension + 8
            
            addSubview(label)
            labels.append(label)
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
}
