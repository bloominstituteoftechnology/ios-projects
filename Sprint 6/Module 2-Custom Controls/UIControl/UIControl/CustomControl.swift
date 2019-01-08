import UIKit

class CustomControl: UIControl {
    var value: Int = 1
    
    private static let componentDimension: CGFloat = 40.0
    private static let componentCount = 5
    private static let componentActiveColor = UIColor.black
    private static let componentInactiveColor = UIColor.gray
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    private func setup() {
        let rating = UILabel.init()
        rating.frame = CGRect(x: 40.0, y: 40.0, width: 40.0, height: 40.0)
        rating.text = ""
        //self.view.addSubview(rating)
        
    }
    
    private func updateValue(at touch: UITouch) {
        
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        sendActions(for: [.touchDown, .valueChanged])
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
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
