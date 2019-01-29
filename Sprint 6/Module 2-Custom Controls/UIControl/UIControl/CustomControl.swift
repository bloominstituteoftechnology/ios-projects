//  Copyright © 2019 Frulwinn. All rights reserved.

import UIKit

class CustomControl: UIControl {
    
    //MARK: - Properties
    var labels: [UILabel] = []
    var value: Int = 1
    
    let componentDimension: CGFloat = 40.0
    let componentCount = 5
    let componentActiveColor = UIColor.black
    let componentInactiveColor = UIColor.gray
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    func setup() {
        var count: CGFloat = 0.0
        for number in 1...5 {
            //spacing
            let space: CGFloat = (componentDimension * count) + (8.0 * count)
            //create labels, set label's frame to size
            let label = UILabel(frame: CGRect(x: space, y: 0, width: componentDimension, height: componentDimension))
            //add one as subview
                self.addSubview(label)
            //store label in local array with append
            labels.append(label)
            //add tag for each view
            label.tag = number
            count += 1.0
            //set font to bold system font size 32
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            //set text to Unicode star
            label.text = "✭"
            //alignment center for label
            label.textAlignment = .center
            //set textColor to active for the first or inactive for the others
            label.textColor = componentInactiveColor
        }
    }
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    //Mark: - Touch handlers
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: [.valueChanged, .touchDragInside])
            updateValue(at: touch)
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer { super.endTracking(touch, with: event) }
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
    func updateValue(at touch: UITouch) {
        //loop through component labels and detects whether touch location is contained in each label's frame
        for label in labels {
            let touchPoint = touch.location(in: self)
            //when touch overlaps label set control's value to that tag
            //update label colors to reflect current touch send valueChanged action
            if label.frame.contains(touchPoint) {
                value = label.tag
                sendActions(for: [.valueChanged])
                label.performFlare()
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
