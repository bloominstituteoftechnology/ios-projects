//
//  CustomControl.swift
//  UIControl
//
//  Created by Jerrick Warren on 11/13/18.
//  Copyright © 2018 Jerrick Warren. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    required init?(coder aCoder: NSCoder){
        super.init(coder: aCoder)
       
        setup()
    }
    
    func setup() {
        
        var x: CGFloat = 8.0
        
        for componentNumber in 1...componentCount {
            let label = UILabel(frame: CGRect(x: x, y: 0, width: componentDimension, height: componentDimension))
            
           // let label2 = UILabel(frame: CGRect(x: x, y: 0, width: componentDimension, height: componentDimension))
            
            label.tag = componentNumber
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.text = "☆"
            label.textAlignment = .center

            if componentNumber == 1 {
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
            }

            self.addSubview(label)
            labels.append(label)
            x += 48.0
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
        guard let touch = touch else {return}
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            sendActions(for: .touchUpOutside)
        }    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }

    // think about extra.valueChanged events.  This may come in handy later
    
    func updateValue(at touch: UITouch) {
        for number in 1...componentCount {
            let label = labels[number - 1]
            let touchPoint = touch.location(in: self)
            if label.frame.contains(touchPoint) && label.tag != value {
                value = label.tag
                for itemIndex in 1...componentCount {
                    let newLabel = labels[itemIndex - 1]
                    if itemIndex <= value {
                        newLabel.textColor = componentActiveColor
                    } else {
                        newLabel.textColor = componentInactiveColor
                    }
                }
                label.performFlare()
                sendActions(for: [.valueChanged])
            }
        }
    }
    
    // MARK: - Properties
    
    var labels: [UILabel] = []
    
    var value: Int = 1
    
    let componentDimension: CGFloat = 40
    let componentCount = 6
    let componentActiveColor: UIColor = .yellow
    let componentInactiveColor: UIColor = .gray
    
    
}

extension UIView {
    // "Flare view" animation sequence
    func performFlare() {
        func flare()   { transform = CGAffineTransform(scaleX: 2.8, y: -2.8) }
        func unflare() { transform = .identity }
        
        UIView.animate(withDuration: 0.3,
                       animations: { flare() },
                       completion: { _ in UIView.animate(withDuration: 0.1) { unflare() }})
    }
}
