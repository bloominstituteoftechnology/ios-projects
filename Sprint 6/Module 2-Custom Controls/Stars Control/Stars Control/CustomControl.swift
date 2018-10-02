//
//  CustomControl.swift
//  Stars Control
//
//  Created by Moin Uddin on 10/2/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    var value: Int = 1
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount: CGFloat = 5
    private let componentActiveColor: UIColor = UIColor.black
    private let componentInactiveColor: UIColor = UIColor.gray
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    private func setup(){
        let labelOne = UILabel(frame: CGRect(x: (8.0), y: 0, width: componentDimension, height: componentDimension))
        let labelTwo = UILabel(frame: CGRect(x: 1.0 * (componentDimension + 8.0), y: 0, width: componentDimension, height: componentDimension))
        let labelThree = UILabel(frame: CGRect(x: 2.0 * (componentDimension + 8.0), y: 0, width: componentDimension, height: componentDimension))
        let labelFour = UILabel(frame: CGRect(x: 3.0 * (componentDimension + 8.0), y: 0, width: componentDimension, height: componentDimension))
        let labelFive = UILabel(frame: CGRect(x: 4.0 * (componentDimension + 8.0), y: 0, width: componentDimension, height: componentDimension))
        
        var count = 0
        starLabels += [labelOne, labelTwo, labelThree, labelFour, labelFive]
        for label in starLabels {
            count+=1
            self.addSubview(label)
            label.tag = count
            label.font = UIFont.boldSystemFont(ofSize: 32)
            label.textAlignment = .center
            label.text = "✰"
            label.textColor = componentInactiveColor
        }
//        var tempComponentDimension: CGFloat
//        for i in 1...5 {
//            let multiplier = i - 1
//            self.addSubview(label)
//            label.tag = i
//            label.font = UIFont.boldSystemFont(ofSize: 32)
//            label.textAlignment = .center
//            label.text = "✰"
//            label.textColor = componentInactiveColor
//        }
    }
    
    var starLabels: [UILabel] = []
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
}
