//
//  CustomControl.swift
//  Custom Control
//
//  Created by Iyin Raphael on 10/2/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount: Int = 5
    private let componentActiveColor: UIColor = .black
    private let componentInactiveColor: UIColor = .gray
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
         setUp()
    }
    

    var labels: [UILabel] = []
   
    func setUp(){
    
        var tags: [Int] = []
        var count: CGFloat = 0.0
   
    
        for i in 1...5 {
        
            let space: CGFloat = (componentDimension * count) + (8.0 * count)
        
    
            let label = UILabel(frame: CGRect(x: space, y: 0.0, width: componentDimension, height: componentDimension))
            label.tag = i
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.text = "☆"
            label.textAlignment = .center
            self.addSubview(label)

            count = count + 1.0
        
            labels.append(label)
            tags.append(tag)
        
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
                value = label.tag
                label.textColor = componentActiveColor
                label.performFlare()
                sendActions(for: [.valueChanged])
            } else {
                label.textColor = componentInactiveColor
                sendActions(for: [.valueChanged])
            }
        }
    }
    
    
    var value: Int = 1
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
