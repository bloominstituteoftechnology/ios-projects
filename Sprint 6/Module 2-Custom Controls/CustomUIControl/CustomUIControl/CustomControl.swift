import Foundation
import UIKit

class CustomControl: UIControl {
    
    static var starValue: Int = 1
    var labelArray: [UILabel] = []
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor(red:0.70, green:0.87, blue:0.95, alpha:1.0)
    private let componentInactiveColor = UIColor.gray
    
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
        
    }
    
    
    func setup(){

        var layoutX: CGFloat = 8.0
        for label in 1...5 {
            let testLabel = UILabel(frame: CGRect(x: layoutX, y: 0, width: componentDimension, height: componentDimension))
            layoutX += componentDimension + 8.0
            testLabel.tag = label
            testLabel.font = UIFont.boldSystemFont(ofSize: 32.0)
            testLabel.textAlignment = .center
            testLabel.text = "\u{2736}"
            if testLabel.tag == 1 {
                testLabel.textColor = componentActiveColor
            }else { testLabel.textColor = componentInactiveColor }
            labelArray.append(testLabel)
            addSubview(testLabel)
            clipsToBounds = true
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    func updateValue(at touch: UITouch){
        
        let touchPoint = touch.location(in: self)
        for label in labelArray {
//            let touchPoint = touch.location(in: self)
            
            if label.frame.contains(touchPoint) {
                if label.textColor == componentInactiveColor {
                    CustomControl.starValue = label.tag
                    print(touchPoint, label.tag)
                    label.textColor = componentActiveColor
                    sendActions(for: .valueChanged)
                }else if label.textColor == componentActiveColor {
                CustomControl.starValue = label.tag - 1
                label.textColor = componentInactiveColor
                sendActions(for: [.valueChanged])
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
            updateValue(at: touch)
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {

        defer { super.endTracking(touch, with: event) } // makes sure super is called in EVERY code path
        guard let touch = touch else {return}
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchUpInside])
            //updateValue(at: touch)
            
        } else {
            
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        
        sendActions(for: [.touchCancel])
        super.cancelTracking(with: event)
    }
    
    
    
    
}
