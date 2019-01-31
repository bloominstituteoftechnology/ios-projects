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
        
        // Set the starting point for the first star
        var xCoordinate: CGFloat = 8.0
        
        for position in 0 ... 4 {
            // create label and its frame as a square
            let star = UILabel(frame: CGRect(x: xCoordinate, y: 0.0, width: componentDimension, height: componentDimension))
            
            // update the coordinate of the next star
            xCoordinate += 8.0 + componentDimension
            
            // add each label as a subview
            addSubview(star)
            
            // store each label into a local array
            labelArray.append(star)
            
            // add a tag to each star
            star.tag = position
            
            // Set the font (bold system font, size 32.0)
            star.font = UIFont.boldSystemFont(ofSize: 32.0)
            
            // Set the text (pick your favorite Unicode star from the character picker)
            // “✯” U+272F - http://xahlee.info/comp/unicode_stars.html
            star.text = "✯"
            
            // Set the alignment (center) for your label.
            star.textAlignment = .center
            
            // Every star but the first should be grayed out.
            if star.tag != 0 {
                star.textColor = componentInactiveColor
            } else {
                star.textColor = componentActiveColor
            }
            
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
        updateValue(at: touch)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        // Send .touchDragInside or .touchDragOutside
        // Call updateValue() if inside
        if bounds.contains(touchPoint) {
            sendActions(for: .touchDragInside)
            updateValue(at: touch)
        } else {
            sendActions(for: .touchDragOutside)
        }
        return true
    }
    
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        if bounds.contains() {
            sendActions(for: [.touchUpInside, .touchUpOutside])
            updateValue(at: <#T##UITouch#>)
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
    
    func updateValue(at touch: UITouch) {
        
    }
    
//
//
//    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
//        // Make sure to call this (super.endTracking) no matter what happens, at the end of the execution of the function.
//        defer {
//            super.endTracking(touch, with: event)
//        }
//
//        guard let touch = touch else {
//            return
//        }
//
//        let touchPoint = touch.location(in: self)
//        if bounds.contains(touchPoint) {
//            sendActions(for: [.touchUpInside, .valueChanged])
//        } else {
//            sendActions(for: [.touchUpOutside])
//        }
//    }
//
//    override func cancelTracking(with event: UIEvent?) {
//        sendActions(for: [.touchCancel])
//        super.cancelTracking(with: event)
//    }
//
//    override func updateValue(at touch: UITouch) {
//        for.loop.componentLabels {
//        guard let touchLocation.labelFrame == true
//            else { return }
//        }
//        touch.meets.label = controlValue.labelArray(tag.indexRow.path)
//        sendAction(for: [valueChanged])
//    }
}
