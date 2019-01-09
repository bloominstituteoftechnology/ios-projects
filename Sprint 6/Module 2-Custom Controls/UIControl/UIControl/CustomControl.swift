import UIKit

class CustomControl: UIControl {
    var value: Int = 1
    var labels: [UILabel] = []
    
    let componentDimension: CGFloat = 40.0
    let componentCount = 5
    let componentActiveColor = UIColor.black
    let componentInactiveColor = UIColor.gray
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    private func setup() {
        var count: CGFloat = 0.0
        for number in 1...5 {
            
            //space between labels
            let space: CGFloat = (componentDimension * count) + (8.0 * count)
            
            //create label
            let label = UILabel(frame: CGRect(x: space, y: 0 , width: componentDimension, height: componentDimension))
            self.addSubview(label)
            
            //tag
            label.text = "☆"
            label.tag = number
            labels.append(label)
            count += 1.0
            
            //font
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            
            //color
            label.textColor = componentInactiveColor
            
        }
    }
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    private func updateValue(at touch: UITouch) {
        //loop that iterates through your component labels and detect whether each touch's location
        for label in labels {
            let touchPoint = touch.location(in: self)
            
            if label.frame.contains(touchPoint) {
                value = label.tag
                sendActions(for: [.valueChanged])
                label.performFlare()
            }
        }
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        sendActions(for: [.touchDown, .valueChanged])
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
        defer { super.endTracking(touch, with:event) }
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
        super.cancelTracking(with: event)
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
