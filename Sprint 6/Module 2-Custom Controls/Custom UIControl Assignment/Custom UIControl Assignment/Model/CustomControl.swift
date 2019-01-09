//
//  CustomControl.swift
//  Custom UIControl Assignment
//
//  Created by Ivan Caldwell on 1/8/19.
//  Copyright © 2019 Ivan Caldwell. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    var value: Int = 1
    
    let componentDimension: CGFloat = 40.0
    let componentCount = 5
    let componentActiveColor = UIColor.black
    let componentInactiveColor = UIColor.gray

    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    func setup() {
        var labels: [UILabel] = []
        var offset: CGFloat = 0
        for num in 1 ... 5 {
            let label = UILabel(frame: CGRect(x: 8.0 + offset, y: 0.0, width: componentDimension, height: componentDimension))
            self.addSubview(label)
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.textAlignment = NSTextAlignment.center
            //label.font = UIFont.boldSystemFont(ofSize: <#T##CGFloat#>)
            if num > 1 {
                label.textColor = componentInactiveColor
            }
            label.text = "✮"
            label.tag = num
            
            labels.append(label)
            offset += 8.0 + componentDimension
            print(offset)
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
}
