//
//  CustomControl.swift
//  Custom UIControl Assignment
//
//  Created by Ivan Caldwell on 1/8/19.
//  Copyright © 2019 Ivan Caldwell. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    // "Flare view" animation sequence
    func performFlare() {
        func flare() { transform = CGAffineTransform(scaleX: 1.6, y: 1.6) }
        func unflare() { transform = .identity }
        UIView.animate(withDuration: 0.3,
                       animations: { flare() },
                       completion: { _ in UIView.animate(withDuration: 0.1) { unflare() }})
    }
}

class CustomControl: UIControl {
    static var value: Int = 1
    var labels: [UILabel] = []

    let componentDimension: CGFloat = 40.0
    let componentCount = 5
    let componentActiveColor = UIColor.black
    let componentInactiveColor = UIColor.gray

    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    func setup() {
        var offset: CGFloat = 0
        for num in 1 ... 5 {
            let label = UILabel(frame: CGRect(x: 8.0 + offset, y: 0.0, width: componentDimension, height: componentDimension))
            self.addSubview(label)
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.textAlignment = NSTextAlignment.center
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
            print("The touch went outside the bounds of the view")
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
        super.cancelTracking(with: event)
        sendActions(for: [.touchCancel])
    }
    
    func updateValue(at touch: UITouch) {
        for label in labels {
            let touchPoint = touch.location(in: label)
            if bounds.contains(touchPoint) {
                CustomControl.value = label.tag
                label.performFlare()
                label.textColor = componentActiveColor
                sendActions(for: [.valueChanged])
            } else {
                label.textColor = componentInactiveColor
                sendActions(for: [.valueChanged])
            }
        }
        
    }
}
