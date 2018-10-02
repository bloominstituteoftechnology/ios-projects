//
//  CustomControl.swift
//  Custom Star Rating Control
//
//  Created by Dillon McElhinney on 10/2/18.
//  Copyright © 2018 Dillon McElhinney. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    var value: Int = 1
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 6
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    private var labels: [UILabel] = []
    
    required init? (coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        
        setup()
    }
    
    private func setup() {
        for i in 1...componentCount {
            let label = UILabel()
            self.addSubview(label)
            labels.append(label)
            label.tag = i
            let x = componentDimension * CGFloat(i-1) + CGFloat(8 * i)
            label.frame = CGRect(x: 0, y: x, width: componentDimension, height: componentDimension)
            label.font = UIFont.boldSystemFont(ofSize: 32)
            label.text = "☆"
            label.textAlignment = .center
            label.textColor = i == 1 ? componentActiveColor : componentInactiveColor
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: componentDimension, height: width)
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: .touchDragInside)
        } else {
            sendActions(for: .touchDragOutside)
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: .touchUpInside)
        } else {
            sendActions(for: .touchUpOutside)
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
        
    }
    
    private func updateValue(at touch: UITouch) {
        let oldValue = value
        for label in labels {
            let touchPoint = touch.location(in: label)
            if label.bounds.contains(touchPoint) { value = label.tag }
            if value != oldValue {
                if label.tag <= value {
                    label.textColor = componentActiveColor
                    updateLabels()
                    label.performFlare()
                } else {
                    label.textColor = componentInactiveColor
                }
                sendActions(for: .valueChanged)
            }
        }
    }
    
    private func updateLabels() {
        for label in labels {
            if label.tag < value { label.textColor = componentActiveColor }
        }
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
