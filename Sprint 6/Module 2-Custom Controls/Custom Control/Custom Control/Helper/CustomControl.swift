//
//  CustomControl.swift
//  Custom Control
//
//  Created by Iyin Raphael on 10/2/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount: Int = 5
    private let componentActiveColor: UIColor = .black
    private let componentInactiveColor: UIColor = .gray
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
         setUp()
    }
    
    func swap<T>(lhs: inout T, rhs: inout T){
        let temp = lhs
        lhs = rhs
        rhs = temp
    }
    
   func setUp(){
    
    var tags: [String] = []
    var count: CGFloat = 0.0
   
    
    for i in 1...5 {
        
        let space: CGFloat = (componentDimension * count) + (8.0 * count)
        let tag = "Tag \(i)"
        tags.append(tag)
    
        let label = UILabel(frame: CGRect(x: space, y: 0.0, width: componentDimension, height: componentDimension))
        label.font = UIFont.boldSystemFont(ofSize: 32.0)
        label.text = "☆"
        label.textColor.is
        label.textAlignment = .center
        self.addSubview(label)

        count = count + 1.0
        
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    var value: Int = 1
}
