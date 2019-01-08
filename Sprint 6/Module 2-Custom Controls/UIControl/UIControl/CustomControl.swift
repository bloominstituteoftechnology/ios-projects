//
//  CustomControl.swift
//  UIControl
//
//  Created by Sergey Osipyan on 1/8/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    
    var value: Int = 1
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
   
    }
   
    
    func setup() {
        for _ in 1...5 {
            let label = UILabel()
            self.addSubview(label)
            var labels: [UILabel] = []
            labels.append(label)
          
        }
        
    }
    
  
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
      //  color = self.color(for: touchPoint)
        sendActions(for: [.touchDown, .valueChanged])
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
          //  color = self.color(for: touchPoint)
            sendActions(for: [.valueChanged, .touchDragInside])
            
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer {  super .endTracking(touch, with: event) }
        guard let  touch = touch else { return}
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
       //     color = self.color(for: touchPoint)
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
        super .cancelTracking(with: event)
        
    }
    
}
