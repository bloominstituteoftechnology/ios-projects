//
//  CustomControl.swift
//  CustomControls
//
//  Created by Nikita Thomas on 11/13/18.
//  Copyright © 2018 Nikita Thomas. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    var value: Int = 1
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    var labels = [UILabel]()
    
    func setup() {
        
        var x: CGFloat = 8.0
        for n in 1...5 {
            let label = UILabel(frame: CGRect(x: x, y: 0, width: componentDimension, height: componentDimension))
            
            label.tag = n
            label.font = UIFont.boldSystemFont(ofSize:32.0) //UIFont(name: "bold system font", size: 32.0)
            label.text = "❔"
            label.textAlignment = .center
            label.isUserInteractionEnabled = false
            
            self.addSubview(label)
            labels.append(label)
            x += componentDimension + 8.0
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    func changeEmoji(after selected: Int) {
        for label in labels {
            if label.tag <= selected {
                label.text = "🔥"
            } else {
                label.text = "❔"
            }
        }
    }
    
    func updateValue(at touch: UITouch) {
        for label in labels {
            let touchPoint = touch.location(in: self)
            let halfway = label.frame.midX

            // Changes after passing halfway point
//            if touchPoint.x > halfway {
//                // Touch is within label frame
//                label.performFlare()
//                value = label.tag
//                changeEmoji(after: value)
//                sendActions(for: [.valueChanged])
//            }
            
            // Changes somewhere in between the emojis
            if label.frame.contains(touchPoint) {
                // Touch is within label frame
                value = label.tag
                changeEmoji(after: value)
                sendActions(for: [.valueChanged])
                label.performFlare()
            }
        }
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        updateValue(at: touch)
        sendActions(for: [.touchDown, .valueChanged])
        
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        if bounds.contains(touch.location(in: self)) {
            updateValue(at: touch)
            sendActions(for: [.touchDragInside, .valueChanged])
        } else {
            sendActions(for: [.touchDragOutside])
        }
        
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer { super.endTracking(touch, with: event)}
        
        guard let touch = touch else {return}
        
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
    
    
}

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
