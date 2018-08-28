//
//  CustomControl.swift
//  ios-star-rating
//
//  Created by De MicheliStefano on 28.08.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    // MARK: - Properties
    
    var previousValue: Int = 1
    var value: Int = 1
    private let componentDimension: CGFloat = 70
    private let componentCount: Int = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    private let componentFontSize: CGFloat = 70
    
    var starLabels: [UILabel] = []
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    func setup() {
        let one = UILabel()
        let two = UILabel()
        let three = UILabel()
        let four = UILabel()
        let five = UILabel()
        
        one.tag = 1; two.tag = 2; three.tag = 3; four.tag = 4; five.tag = 5
        
        one.frame = CGRect(x: 8, y: 0, width: componentDimension, height: componentDimension)
        two.frame = CGRect(x: componentDimension + 8.0, y: 0.0, width: componentDimension, height: componentDimension)
        three.frame = CGRect(x: componentDimension * 2 + 8.0, y: 0.0, width: componentDimension, height: componentDimension)
        four.frame = CGRect(x: componentDimension * 3 + 8.0, y: 0.0, width: componentDimension, height: componentDimension)
        five.frame = CGRect(x: componentDimension * 4 + 8.0, y: 0.0, width: componentDimension, height: componentDimension)
        
        one.font = UIFont.boldSystemFont(ofSize: componentFontSize)
        two.font = UIFont.boldSystemFont(ofSize: componentFontSize)
        three.font = UIFont.boldSystemFont(ofSize: componentFontSize)
        four.font = UIFont.boldSystemFont(ofSize: componentFontSize)
        five.font = UIFont.boldSystemFont(ofSize: componentFontSize)
        
        one.text = "✮"; two.text = "✮"; three.text = "✮"; four.text = "✮"; five.text = "✮"
        
        one.textAlignment = .center
        two.textAlignment = .center
        three.textAlignment = .center
        four.textAlignment = .center
        five.textAlignment = .center
        
        starLabels = [one, two, three, four, five]
        
        self.addSubview(one)
        self.addSubview(two)
        self.addSubview(three)
        self.addSubview(four)
        self.addSubview(five)
        
    }
    
    func updateValue(at touch: UITouch) {
        for label in starLabels {
            let touchPoint = touch.location(in: label)
            label.textColor = previousValue >= label.tag ? componentActiveColor : componentInactiveColor
            
            if label.bounds.contains(touchPoint) {
                value = label.tag
                label.textColor = componentActiveColor
                label.performFlare()
                
                if value != previousValue {
                    sendActions(for: .valueChanged)
                    previousValue = value
                }
            }
        }
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchDragInside])
        } else {
            sendActions(for: [.touchDragOutside])
        }
        updateValue(at: touch)
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchUpInside])
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
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
