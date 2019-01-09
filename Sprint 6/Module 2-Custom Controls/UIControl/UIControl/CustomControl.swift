//
//  CustomControl.swift
//  UIControl
//
//  Created by Sergey Osipyan on 1/8/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    
    static var value: Int = 1
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
   
    }
   
    var labels: [UILabel] = []
    
    func setup() {
       
        var tags: [Int] = []
        var coordinate: CGFloat = 8.0
        for number in 1...5 {
        
            var label = UILabel()
            
            
            let location: CGFloat = coordinate
            label = UILabel(frame: CGRect(x: location, y: 0.0, width: componentDimension, height: componentDimension))
            label.tag = number
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.text = "✯"
            label.textAlignment = .center
            label.textColor = componentInactiveColor
            self.addSubview(label)
            labels.append(label)
            tags.append(tag)
             coordinate += 48
            
            
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
        let touchPoint =  touch.location(in: self)
        if bounds.contains(touchPoint){
            self.updateValue(at: touch)
            sendActions(for: [.touchDragInside, .valueChanged])
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touchPoint =  touch?.location(in: self) else {return}
        if bounds.contains(touchPoint){
            self.updateValue(at: touch!)
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
        super.cancelTracking(with: event)
    }
    
    func updateValue(at touch: UITouch ) {
        for label in labels {
            let touchPoint = touch.location(in: label)
            if bounds.contains(touchPoint) {
                CustomControl.value = label.tag
                label.textColor = componentActiveColor
                label.performFlare()
                sendActions(for: [.valueChanged])
            } else {
                label.textColor = componentInactiveColor
                sendActions(for: [.valueChanged])
            }
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
    

