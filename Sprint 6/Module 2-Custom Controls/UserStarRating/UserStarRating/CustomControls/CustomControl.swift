//
//  CustomControl.swift
//  UserStarRating
//
//  Created by Benjamin Hakes on 1/8/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    static var value: Int = 1
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    required init?(coder aCoder: NSCoder){
        super.init(coder: aCoder)
        
        setup()
    }
    
    private func setup(){
        var labelArray: [UILabel] = []
        for x in 0..<5{
            labelArray.append(UILabel())
            guard let mostRecentLabel = labelArray.last else {fatalError("could not get last element")}
            mostRecentLabel.tag = x + 1
            mostRecentLabel.frame = CGRect(origin: CGPoint(x: 8.0 + (Double(x) * 48.0), y: 0.0), size: CGSize(width: componentDimension, height: componentDimension))
            mostRecentLabel.font = UIFont.boldSystemFont(ofSize: CGFloat(integerLiteral: 32))
            mostRecentLabel.text = "★"
            mostRecentLabel.textAlignment = .center
            if x > 0 {
                mostRecentLabel.textColor = componentActiveColor
            } else {
                mostRecentLabel.textColor = componentInactiveColor
            }
            
            self.addSubview(mostRecentLabel)
            
            
        }
        print(labelArray)
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
}
