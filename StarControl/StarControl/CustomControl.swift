//
//  CustomControl.swift
//  StarControl
//
//  Created by Jocelyn Stuart on 1/29/19.
//  Copyright © 2019 JS. All rights reserved.
//

import UIKit

extension UIView {
    // "Flare view" animation sequence
    func performFlare() {
        func flare()   { transform = CGAffineTransform(scaleX: 1.6, y: 1.6) }
        func unflare() { transform = .identity }
        
        UIView.animate(withDuration: 0.3,
                       animations: { flare() },
                       completion: { _ in UIView.animate(withDuration: 0.1) { unflare() }})
    }
}

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
        
        var count: CGFloat = -40.0
        while labelArray.count <= 4 {
            count += (8.0 + componentDimension)
            var newLabel = UILabel(frame: CGRect(x: count, y: 0.0, width: componentDimension, height: componentDimension))
            newLabel.textAlignment = .center
            newLabel.text = "★"
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
            // ★BLACK STAR Unicode: U+2605, UTF-8: E2 98 85
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
            sendActions(for: [.valueChanged, .touchDragInside])
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
            sendActions(for: [.valueChanged, .touchUpInside])
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
    
    func updateValue(at touch: UITouch) {
        let tapLocation = touch.location(in: self)
        for label in labelArray {
            if label.frame.contains(tapLocation) {
                label.performFlare()
                value = label.tag
                if label.textColor == componentInactiveColor && value != 1 {
                    label.textColor = componentActiveColor
                    for otherlabel in labelArray {
                        if otherlabel.tag <= label.tag {
                            otherlabel.textColor = componentActiveColor
                        } else {
                            otherlabel.textColor = componentInactiveColor
                        }
                    }
                } else if label.textColor == componentActiveColor && value != 1 {
                    label.textColor = componentInactiveColor
                    value = label.tag - 1
                    for otherlabel in labelArray {
                        if otherlabel.tag >= label.tag {
                            otherlabel.textColor = componentInactiveColor
                        }
                    }
                } else if value == 1 {
                    for otherlabel in labelArray {
                        if otherlabel.tag > 1 {
                            otherlabel.textColor = componentInactiveColor
                        }
                    }
                }
                
                sendActions(for: [.valueChanged])
            }
        }
    }
    
    
    
    
    
    
}
