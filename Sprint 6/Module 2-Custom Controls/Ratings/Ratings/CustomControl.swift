//
//  CustomControl.swift
//  Ratings
//
//  Created by Nelson Gonzalez on 1/29/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    var value: Int = 1
    private(set) var labelArray: [UILabel] = []
    
    private let componentDimension: CGFloat = 40
    private let componentCount = 5
    private let componentActiveColor: UIColor = UIColor.black
    private let componentInactiveColor: UIColor = UIColor.gray
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    func setup() {
        
        // Variable to increment spacing
        var count: CGFloat = 0.0
        
        for labels in 1...5 {
            
            let spacing: CGFloat = (componentDimension * count) + (8.0 * count)
            
            let label = UILabel(frame: CGRect(x: spacing, y: 0.0, width: componentDimension, height: componentDimension))
            
            // Add label as a subview
            self.addSubview(label)
            
            // Add label to array
            labelArray.append(label)
            
            // Tag label
            label.tag = labels
            
            // Label characteristics
            label.text = "✮"
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.textAlignment = .center
            
            // First label has active color, the rest have the inactive color
        
            if label.tag > 1 {
                label.textColor = componentInactiveColor
            } else {
                label.textColor = componentActiveColor
            }
            
            //increase the count of the label to get out of the loop
            count += 1.0
 
        }
    }

     // Tell Auto Layout how big the custom control should be
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    func updateValue(at touch: UITouch) {
        // Stores the value previously held before movement changes
        let oldValue = value
        
        // Check if touches intersect with stored label subviews
        //  let touchPoint = touch.location(in: self)
        for labels in labelArray {
            // Detect whether each touch's location is contained in each label's frame
            if labels.frame.contains(touch.location(in: self)) {
                
                // Set the control's value to the label's tag
                value = labels.tag
            }
            
            
            // If value has changed/moved.
            if value != oldValue {
                
                // if label tag matches the value...
                if labels.tag == value {
                    
                    // Update label colors
                    updateLabels()
                    
                    // Send action for valueChanged
                    sendActions(for: .valueChanged)
                }
            }
            
        }
        
    }
    
    // Update the label colors
    private func updateLabels() {
        
        // For each label in the labels array
        for labels in labelArray {
            
            // If the label's tag is less than or equal to the value
            if labels.tag <= value {
                
                // Label color is active
                labels.textColor = componentActiveColor
                
                // Label animates with flare
                labels.performFlare()
                
            } else {
                
                // Labels in front of the value label keep the inactive color
                labels.textColor = componentInactiveColor
            }
        }
    }
    
     // MARK: - Touch Handler Implementation
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
         // Respond to the start of user's touch
        updateValue(at: touch)
        sendActions(for: .touchDown)
        return true
    }
    //user moves the finger inside/outside control
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        // Assign the touch point to the current location
        let touchPoint = touch.location(in: self)
         // If contained within the view, send the actions
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchDragInside, .touchDragOutside])
            // Update the value
            updateValue(at: touch)
        }
        return true
    }
    //user lifts finger
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
         defer { super.endTracking(touch, with: event) }
        guard let touch = touch else {return}
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchUpInside, .touchUpOutside])
            updateValue(at: touch)
        }
    }
    //incoming phone call that will interrupt user event. *Required*
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
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
