import UIKit

class CustomControl: UIControl {
    var value: Int = 1
    
    // private constants
    
    private let componentDimension: CGFloat = 40
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    var labelArray: [UILabel] = []
    
    func setup() {
        
        
//        for index in 0..<ViewController.starCount {
//            print("shut up, xcode")
//            var newLabel = create.UILabel
//            labelArray.append(newLabel)
//            let tag = labelArray[indexPath.row]
//            label.frameSize = [componentDimension, componentDimension]
//            func labelTray {
//                UIStackView.labelArray.spacing(8)
//                UIStackView.labelArray.initialSpacing(8)
//            }
//            label.font = .systemBold
//            label.fontSize = 32
//            label.text = "*"
//            label.alignment = center
//            if label == active {
//                label.textColor = componentActiveColor
//            } else {
//                label.textColor = componentInactiveColor
//            }
//        }
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        // Track the touch location in the view
        let touchPoint = touch.location(in: self)
        // Set the color based on the user touch location
        sendActions(for: [.touchDown, .valueChanged])
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        print("Continue tracking touch: \(touch.location(in: self))")
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchDragInside, .valueChanged])
        } else {
            sendActions(for: [.touchDragOutside])
        }
        // Continues tracking
        return true
    }
    
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        // Make sure to call this (super.endTracking) no matter what happens, at the end of the execution of the function.
        defer {
            super.endTracking(touch, with: event)
        }
        
        guard let touch = touch else {
            return
        }
        
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
        super.cancelTracking(with: event)
    }
    
    override func updateValue(at touch: UITouch) {
        for.loop.componentLabels {
        guard let touchLocation.labelFrame == true
            else { return }
        }
        touch.meets.label = controlValue.labelArray(tag.indexRow.path)
        sendAction(for: [valueChanged])
    }
    var color: UIColor = .white
}
