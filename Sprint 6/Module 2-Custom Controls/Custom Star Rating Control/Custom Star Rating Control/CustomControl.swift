//
//  CustomControl.swift
//  Custom Star Rating Control
//
//  Created by Dillon McElhinney on 10/2/18.
//  Copyright © 2018 Dillon McElhinney. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    var value: Int = 1
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    required init? (coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        
        setup()
    }
    
    private func setup() {
        var labels: [UILabel] = []
        for i in 1...componentCount {
            let label = UILabel()
            self.addSubview(label)
            labels.append(label)
            label.tag = i
            let x = componentDimension * CGFloat(i-1) + CGFloat(8 * i)
            label.frame = CGRect(x: x, y: 0, width: componentDimension, height: componentDimension)
            label.font = UIFont.boldSystemFont(ofSize: 32)
            label.text = "☆"
            label.textAlignment = .center
            label.textColor = i == 1 ? componentActiveColor : componentInactiveColor
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
}
