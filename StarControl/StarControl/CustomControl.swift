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
        while labelArray.count <= 4 {
            count += (8.0 + componentDimension)
            var newLabel = UILabel(frame: CGRect(x: count, y: 0.0, width: componentDimension, height: componentDimension))
            newLabel.textAlignment = .center
            newLabel.text = "☆"
            newLabel.font = UIFont(name: "bold system font", size: 32.0)
            if count == 8.0 {
                newLabel.textColor = componentActiveColor
            } else {
                newLabel.textColor = componentInactiveColor
            }
            
            labelArray.append(newLabel)
            newLabel.tag = self.labelArray.count
            self.addSubview(newLabel)
            
            // ☆WHITE STAR U+2606
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    
    
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchDragInside])
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer { super.endTracking(touch, with: event) }
        
        guard let touch = touch else { return }
        
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchUpInside])
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
    
    func updateValue(at touch: UITouch) {
        
    }
    
}
