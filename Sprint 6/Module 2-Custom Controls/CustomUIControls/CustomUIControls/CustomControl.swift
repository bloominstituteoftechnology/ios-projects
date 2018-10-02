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
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        
        sendActions(for: [.touchDown, .valueChanged])
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            
            sendActions(for: [.touchDragInside, .valueChanged])
        } else {
            sendActions(for: [.touchDragOutside])
        }
        
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
    func updateValue(at touch: UITouch) {
        
    }
    
    let componentDimension: CGFloat = 40.0
    let componentCount = 5
    
    let componentActiveColor = UIColor.black
    let componentInactiveColor = UIColor.gray
    
    var value: Int = 1
    
    
}
