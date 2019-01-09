
import UIKit

class CustomControl: UIControl {
    
    let viewController = ViewController()
    
    var value: Int = 1
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    var subviewArray: [UILabel] = []
    
    // New variable to increment the spacing
    var count: CGFloat = 0.0
    
    func setup() {
        
        // Create 5 labels
        for eachNumber in 1 ... 5 {
            
            // Create the labels
            let spacing: CGFloat = (componentDimension * count) + (8.0 * count)
            let rect = CGRect(x: spacing, y: 0, width: componentDimension, height: componentDimension)
            let label = UILabel(frame: rect)
            
            // Add each label as a subview
            self.addSubview(label)
            
            // Set label's physical characteristics
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.text = "✮"
            label.textAlignment = .center

            //subviewArray[1].textColor = componentActiveColor
            
            // Add a tag for each view to represent which star it is
            label.tag = eachNumber
            
            if label.tag < 2 {
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
            }
            
            // Store each label into a local array
            subviewArray.append(label)

            // Increase count
            count += 1.0

        }
    }
    
    
    
    // Tells Auto Layout how big the custom control should be
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        // Respond to the start of user's touch
        updateValue(at: touch)
        
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        // Assign the touch point to the location
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
        // Defer: regardless of what happens in function, do this before returning
        defer { super.endTracking(touch, with: event) }
        
        // Unwrap the touch because it's optional
        guard let touch = touch else { return }
        
        // Assign the touch point to the location
        let touchPoint = touch.location(in: self)
        
        // If contained within the view, send the actions
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchUpInside, .touchUpOutside])
            
            // Update the value
            updateValue(at: touch)
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
        super.cancelTracking(with: event)
    }
    
    
    func updateValue(at touch: UITouch) {
        
        for eachLabel in subviewArray {
            
        }
        
    }
    
}
