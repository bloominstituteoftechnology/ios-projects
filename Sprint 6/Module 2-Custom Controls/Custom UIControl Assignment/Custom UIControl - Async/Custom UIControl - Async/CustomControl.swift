//
//  CustomControl.swift
//  Custom UIControl - Async
//
//  Created by Ivan Caldwell on 1/15/19.
//  Copyright © 2019 Ivan Caldwell. All rights reserved.
//

import Foundation
import UIKit

import Foundation
import UIKit

extension UIView {
    // "Flare view" animation sequence
    func performFlare() {
        func flare() {
            transform = CGAffineTransform(scaleX: 1.6, y: 1.6)
        }
        func unflare() { transform = .identity }
        UIView.animate(withDuration: 0.3,
                       animations: { flare()},
                       completion: { _ in UIView.animate(withDuration: 0.1) { unflare() }})
    }
}

class CustomControl: UIControl {
    var value: Int = 1
    var oldValue: Int = 1
    var offset: CGFloat = 0
    var labels: [UILabel] = []
    
    private let componentDimension :CGFloat = 40.0
    private let componentCount = 6
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    func setup() {
        for num in 1 ... componentCount {
            let label: UILabel = UILabel(frame: CGRect(x: 8.0 + offset,
                                                       y: 0.0,
                                                       width: componentDimension,
                                                       height: componentDimension))
            self.addSubview(label)
            label.tag = num
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.text = "✯"
            label.textAlignment = NSTextAlignment.center
            if label.tag > 1 {
                label.textColor = componentInactiveColor
            }
            labels.append(label)
            offset += 8.0 + componentDimension
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
    
    func updateValue (at touch: UITouch) {
        for label in labels {
            let touchPoint = touch.location(in: label)
            if bounds.contains(touchPoint) {
                value = label.tag
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
