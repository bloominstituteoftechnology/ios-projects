//
//  CustomControl.swift
//  Stars Control
//
//  Created by Moin Uddin on 10/2/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    var value: Int = 1
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount: CGFloat = 5
    private let componentActiveColor: UIColor = UIColor.black
    private let componentInactiveColor: UIColor = UIColor.gray
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    private func setup(){
        let labelOne = UILabel(frame: CGRect(x: (8.0), y: 0, width: componentDimension, height: componentDimension))
        let labelTwo = UILabel(frame: CGRect(x: 1.0 * (componentDimension + 8.0), y: 0, width: componentDimension, height: componentDimension))
        let labelThree = UILabel(frame: CGRect(x: 2.0 * (componentDimension + 8.0), y: 0, width: componentDimension, height: componentDimension))
        let labelFour = UILabel(frame: CGRect(x: 3.0 * (componentDimension + 8.0), y: 0, width: componentDimension, height: componentDimension))
        let labelFive = UILabel(frame: CGRect(x: 4.0 * (componentDimension + 8.0), y: 0, width: componentDimension, height: componentDimension))
        
        var count = 0
        starLabels += [labelOne, labelTwo, labelThree, labelFour, labelFive]
        for label in starLabels {
            count+=1
            self.addSubview(label)
            label.tag = count
            label.font = UIFont.boldSystemFont(ofSize: 32)
            label.textAlignment = .center
            label.text = "✰"
            label.textColor = componentInactiveColor
        }
//        var tempComponentDimension: CGFloat
//        for i in 1...5 {
//            let multiplier = i - 1
//            self.addSubview(label)
//            label.tag = i
//            label.font = UIFont.boldSystemFont(ofSize: 32)
//            label.textAlignment = .center
//            label.text = "✰"
//            label.textColor = componentInactiveColor
//        }
    }
    
    
    
    var starLabels: [UILabel] = []
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    var activeStars: Int {
        var count: Int = 0
        for label in starLabels {
            if label.textColor == componentActiveColor {
                count+=1
            }
        }
        return count
    }
    
    private func updateValue(at touch: UITouch) {
        for label in starLabels {
            if  bounds.contains(touch.location(in: label)) {
                label.performFlare()
                label.textColor = componentActiveColor
                sendActions(for: [.valueChanged])
            } else {
                label.textColor = componentInactiveColor
                sendActions(for: [.valueChanged])
            }
        }
    }
    
//    if label.textColor == componentInactiveColor {
//        label.textColor = componentActiveColor
//    } else {
//        label.textColor = componentInactiveColor
//    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        sendActions(for: [.touchDown])
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            print("continue tracking")
            updateValue(at: touch)
            sendActions(for: [.touchDragInside])
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touchPoint = touch?.location(in: self),
            let touch = touch else { return }
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: [.touchUpInside])
        } else {
            sendActions(for: [.touchUpInside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
}
