

import UIKit

class CustomControl: UIControl {
    
    // Establish control as a value-providing and value-changing type
    var value: Int = 1
    
    // Array to store label
    var labelsArray: [UILabel] = []
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        
        // Call function that does the setup work
        setup()
    }
    

    
    func setup() {
        
        // Variable to increment spacing
        var count: CGFloat = 0.0
        
        for eachlabel in 1...5 {
            
            let spacing: CGFloat = (componentDimension * count) + (8.0 * count)
            
            let label = UILabel(frame: CGRect(x: spacing, y: 0.0, width: componentDimension, height: componentDimension))
            
            // Add label as a subview
            self.addSubview(label)
            
            // Add label to array
            labelsArray.append(label)
            
            // Tag label
            label.tag = eachlabel
        
            // Label characteristics
            label.text = "✮"
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.textAlignment = .center
            
            // First label has active color, the rest have the inactive color
            //label.textColor = componentInactiveColor
            if label.tag > 1 {
                label.textColor = componentInactiveColor
            } else {
                label.textColor = componentActiveColor
            }

            // Increase count of label
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
    
    
    // MARK: - Touch Handler Implementation
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        // Respond to the start of user's touch
        updateValue(at: touch)
        
        sendActions(for: [.touchDown, .valueChanged])
        
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        // Assign the touch point to the current location
        let touchPoint = touch.location(in: self)
        
        // If contained within the view, send the actions
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchDragInside, .touchDragOutside])
            
            // Update the value
            updateValue(at: touch)
        }
        
        // Continue tracking the touch event
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        // Defer: call super before returning, regardless of what happens in function
        defer { super.endTracking(touch, with: event) }
        
        // Touch is optional, so unwrap it
        guard let touch = touch else { return }
        
        // Assign the touch point to the current location
        let touchPoint = touch.location(in: self)
        
        // If contained within the view, send the actions
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchUpInside, .touchUpOutside])
            
            // Update the value
            updateValue(at: touch)
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
    func updateValue(at touch: UITouch) {
        
        var count = 0
        // Check if touches intersect with stored label subviews
        for eachLabel in labelsArray {
            
            // Detect whether each touch's location is contained in each label's frame
            if eachLabel.frame.contains(touch.location(in: self)) {
                
                // Set the control's value to the label's tag
                value = eachLabel.tag
                
                // Update label colors
                eachLabel.textColor = componentActiveColor
                
//                var eachLabelTag = eachLabel.tag
                
//                if eachLabelTag < eachLabel.tag {
//                    eachLabel.textColor = componentActiveColor
//                }
                

                // Send action for valueChanged
                sendActions(for: .valueChanged)
                
                count += 1
                
                eachLabel.performFlare()
                
            } else {
                eachLabel.textColor = componentInactiveColor
                sendActions(for: .valueChanged)
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
