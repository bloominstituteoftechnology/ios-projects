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
            
            label.tag = componentNumber
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.text = "✩"
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


    var labels: [UILabel] = []
    
    var value: Int = 1
    
    let componentDimension: CGFloat = 40
    let componentCount = 5
    let componentActiveColor: UIColor = .black
    let componentInactiveColor: UIColor = .gray
    
    
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
