//
//  CustomControl.swift
//  Custom Control
//
//  Created by Jeremy Taylor on 8/28/18.
//  Copyright © 2018 Bytes-Random L.L.C. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    var value = 1
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    var starLabels: [UILabel] = []
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        let star1 = UILabel()
        let star2 = UILabel()
        let star3 = UILabel()
        let star4 = UILabel()
        let star5 = UILabel()
        
        star1.tag = 1
        star2.tag = 2
        star3.tag = 3
        star4.tag = 4
        star5.tag = 5
        
        star1.frame = CGRect(x: 8, y: 0, width: componentDimension, height: componentDimension)
        star2.frame = CGRect(x: componentDimension + 8.0, y: 0.0, width: componentDimension, height: componentDimension)
        star3.frame = CGRect(x: componentDimension * 2 + 8.0, y: 0.0, width: componentDimension, height: componentDimension)
        star4.frame = CGRect(x: componentDimension * 3 + 8.0, y: 0.0, width: componentDimension, height: componentDimension)
        star5.frame = CGRect(x: componentDimension * 4 + 8.0, y: 0.0, width: componentDimension, height: componentDimension)
        
        star1.font = UIFont.boldSystemFont(ofSize: 32.0)
        star2.font = UIFont.boldSystemFont(ofSize: 32.0)
        star3.font = UIFont.boldSystemFont(ofSize: 32.0)
        star4.font = UIFont.boldSystemFont(ofSize: 32.0)
        star5.font = UIFont.boldSystemFont(ofSize: 32.0)
        
        star1.text = "☆"
        star2.text = "☆"
        star3.text = "☆"
        star4.text = "☆"
        star5.text = "☆"
        
        star1.textAlignment = .center
        star2.textAlignment = .center
        star3.textAlignment = .center
        star4.textAlignment = .center
        star5.textAlignment = .center
        
        starLabels = [star1, star2, star3, star4, star5]
        
        self.addSubview(star1)
        self.addSubview(star2)
        self.addSubview(star3)
        self.addSubview(star4)
        self.addSubview(star5)
        
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: .touchDragInside)
        } else {
            sendActions(for: .touchDragOutside)
        }
        
        updateValue(at: touch)
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: .touchUpInside)
        } else {
            sendActions(for: .touchUpOutside)
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
    
    func updateValue(at touch: UITouch) {
        for label in starLabels {
            let touchPoint = touch.location(in: label)
            if label.bounds.contains(touchPoint) {
                value = label.tag
                label.textColor = componentActiveColor
                sendActions(for: .valueChanged)
            }
        }
    }
}
