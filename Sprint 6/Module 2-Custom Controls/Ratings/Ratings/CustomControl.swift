//
//  CustomControl.swift
//  Ratings
//
//  Created by Nelson Gonzalez on 1/29/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    var value: Int = 1
    private(set) var labelArray: [UILabel] = []
    
    private let componentDimension: CGFloat = 40
    private let componentCount = 5
    private let componentActiveColor: UIColor = UIColor.black
    private let componentInactiveColor: UIColor = UIColor.gray
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    func setup() {
        
        // Variable to increment spacing
        var count: CGFloat = 0.0
        
        for labels in 1...5 {
            let spacing: CGFloat = (componentDimension * count) + (8.0 * count)
            
            let label = UILabel(frame: CGRect(x: spacing, y: 0.0, width: componentDimension, height: componentDimension))
            
            // Add label as a subview
            self.addSubview(label)
            
            // Add label to array
            labelArray.append(label)
            
            // Tag label
            label.tag = labels
            
            // Label characteristics
            label.text = "✮"
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.textAlignment = .center
            
            if label.tag > 1 {
                label.textColor = componentInactiveColor
            } else {
                label.textColor = componentActiveColor
            }
            
            count += 1.0
 
        }
    }

    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
}
