//
//  CustomControl.swift
//  Custom Control
//
//  Created by Julian A. Fordyce on 1/8/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    var value: Int = 1
    
    var labels: [UILabel] = []
    
    var count: CGFloat = 0.0
    

    private let componentDimension: CGFloat = 40.0
    private let componentCount: CGFloat = 5
    private let componentActiveColor: UIColor = UIColor.black
    private let componentInactiveColor: UIColor = UIColor.gray
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        for number in 1 ... 5 {
            let space: CGFloat = (componentDimension * count) + (8.0 * count)
            let label: UILabel = UILabel(frame: CGRect(x: space, y: 0, width: componentDimension, height: componentDimension))
            self.addSubview(label)
            label.font = UIFont.systemFont(ofSize: 32.0)
            label.text = "★"
            label.textColor = componentInactiveColor
            label.tag = number
            labels.append(label)
            count += 1.0
            print("Tag \(number)")
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: .init())
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchDragInside, .valueChanged])
            updateValue(at: .init())
        } else {
            sendActions(for: .touchDragOutside)
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer { super.endTracking(touch, with: event) }
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            sendActions(for: .touchUpOutside)
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
    
    func updateValue(at touch: UITouch) {
        let touchPoint = touch.location(in: self)
    
        for label in labels {
            if label.bounds.contains(touchPoint) {
                value = label.tag
                label.textColor = componentActiveColor
                sendActions(for: .valueChanged)
                
            }
        }
    }
    
}
