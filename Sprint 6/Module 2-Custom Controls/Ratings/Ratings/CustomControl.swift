//
//  CustomControl.swift
//  Ratings
//
//  Created by Lisa Sampson on 8/28/18.
//  Copyright © 2018 Lisa Sampson. All rights reserved.
//

import UIKit

@IBDesignable class CustomControl: UIControl {
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        
        setup()
    }
    
    func setup() {
        
        var labels = [UILabel]()
        
        for index in 0...4 {
            let x = CGFloat(index)*(componentDimension + 8.0)
            let newLabel = UILabel(frame: CGRect(x: x, y: 0.0, width: componentDimension, height: componentDimension))
            newLabel.tag = index + 1
            newLabel.font = UIFont.boldSystemFont(ofSize: 32.0)
            newLabel.text = "✰"
            newLabel.textAlignment = .center
            newLabel.textColor = index == 0 ? componentActiveColor : componentInactiveColor
            
            addSubview(newLabel)
            labels.append(newLabel)
        }
        
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    // MARK: - Properties
    
    var value: Int = 1
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray

}
