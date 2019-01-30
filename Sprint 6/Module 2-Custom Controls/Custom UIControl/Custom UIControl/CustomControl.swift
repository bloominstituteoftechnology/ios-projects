//
//  CustomControl.swift
//  Custom UIControl
//
//  Created by Moses Robinson on 1/29/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    var value: Int = 1
    
    private let componentDimension: CGFloat = 40
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    var labels: [UILabel] = []
    
    private func setup() {
        
        var x: CGFloat = 8.0
        
        for component in 1...componentCount {
            
            let label = UILabel(frame: CGRect(x: x, y: 0, width: componentDimension, height: componentDimension))
            label.tag = component
            label.font = UIFont.boldSystemFont(ofSize: 32)
            label.text = "☃︎"
            label.textAlignment = .center
            label.textColor = componentInactiveColor
            
            x += componentDimension + 8
            
            addSubview(label)
            labels.append(label)
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    // MARK: - Touch Tracking
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
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
        defer { super.endTracking(touch, with: event) }
        
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
    
    // MARK: - Private Method
    
    private func updateValue(at touch: UITouch) {
        for label in labels {
            let touchPoint = touch.location(in: self)
            if label.frame.contains(touchPoint) {
                value = label.tag
                sendActions(for: [.valueChanged])
            }
        }
        
        for label in labels {
            label.textColor = (label.tag <= value) ? componentActiveColor : componentInactiveColor
        }
    }
    
}
