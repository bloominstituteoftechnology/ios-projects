//
//  CustomControl.swift
//  CustomUIControls
//
//  Created by Daniela Parra on 10/2/18.
//  Copyright © 2018 Daniela Parra. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        
        setup()
    }
    
    private func setup() {
        
        var labels: [UILabel] = []
        for componentNumber in 1...componentCount {
            let label = UILabel()
            
            label.tag = componentNumber
            
            let x = ((componentNumber * 8) + Int(componentDimension) * (componentNumber - 1))
            label.frame = CGRect(x: CGFloat(x), y: 0, width: componentDimension, height: componentDimension)
            
            label.font = UIFont.boldSystemFont(ofSize: 32)
            label.text = "✰"
            label.textAlignment = .center
        
            if componentNumber == 1 {
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
            }
            
            labels.append(label)
            addSubview(label)
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    let componentDimension: CGFloat = 40.0
    let componentCount = 5
    
    let componentActiveColor = UIColor.black
    let componentInactiveColor = UIColor.gray
    
    var value: Int = 1
    
    
}
