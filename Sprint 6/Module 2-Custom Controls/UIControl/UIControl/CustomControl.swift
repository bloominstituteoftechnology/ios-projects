import UIKit

class CustomControl: UIControl {
    var value: Int = 1
    var labels: [Label] = []
    
    private static let componentDimension: CGFloat = 40.0
    private static let componentCount = 5
    private static let componentActiveColor = UIColor.black
    private static let componentInactiveColor = UIColor.gray
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    private func setup() {
        for number in 1...5 {
            //create label
            //append label
            let label = UILabel(frame: CGRect(x: 0, y: 0 , width: 40.0, height: 40.0))
            self.view.addSubview(label)
        }
    }
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    private func updateValue(at touch: UITouch) {
        
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
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
        
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
        super.cancelTracking(with: event)
    }
}
