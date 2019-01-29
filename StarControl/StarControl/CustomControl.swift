//
//  CustomControl.swift
//  StarControl
//
//  Created by Jocelyn Stuart on 1/29/19.
//  Copyright © 2019 JS. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    var value: Int = 1
    
    var labelArray: [UILabel] = []
    
    let componentDimension: CGFloat = 40.0
    let componentCount: CGFloat = 5.0
    let componentActiveColor = UIColor.black
    let componentInactiveColor = UIColor.gray
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    func setup() {
        var count: CGFloat = 0.0
        while labelArray.count <= 5 {
            //newLabel.tag = self.labelArray.count
            count += 8.0
            var newLabel = UILabel(frame: CGRect(x: count, y: 0.0, width: componentDimension, height: componentDimension))
            labelArray.append(newLabel)
            newLabel.tag = self.labelArray.count
            self.addSubview(newLabel)
        
        }
    }
    
    
}
