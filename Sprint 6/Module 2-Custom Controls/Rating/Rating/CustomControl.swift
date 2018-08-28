//
//  CustomControl.swift
//  Rating
//
//  Created by Ngozi Ojukwu on 8/28/18.
//  Copyright © 2018 iyin. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    var value: Int = 1
    
    private let componentDimension = CGFloat(40.0)
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactivColor = UIColor.gray
    
    required init?(coder aCoder: NSCoder){
        super.init(coder: aCoder)
        setUp()
    }
    
    func setUp(){
        let star1Label = UILabel(frame: CGRect(x: 0, y: 0, width: componentDimension, height: componentDimension))
        let start2Label = UILabel(frame: CGRect(x: (componentDimension + 8.0), y: 0, width: componentDimension, height: componentDimension))
        let start3Label = UILabel(frame: CGRect(x: 2 * (componentDimension + 8.0), y: 0, width: componentDimension, height: componentDimension))
        let start4Label = UILabel(frame: CGRect(x: 3 * (componentDimension + 8.0), y: 0, width: componentDimension, height: componentDimension))
        let start5Label = UILabel(frame: CGRect(x: 4 * (componentDimension + 8.0), y: 0, width: componentDimension, height: componentDimension))
        
        let arrayOfLabel: [UILabel] = [star1Label, start2Label, start3Label, start4Label, start5Label]
        for label in arrayOfLabel{
            self.addSubview(label)
            label.tag = arrayOfLabel.index(of: label)! + 1
            label.font = UIFont.boldSystemFont(ofSize: 32)
            label.text = "☆"
            label.textAlignment = .center
            label.textColor = componentActiveColor
        }
    }
    
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
}
