import UIKit

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

class CustomControl: UIControl {
    static var value: Int = 1
    
    private let componentDimension: CGFloat = 40
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    var labelArray: [UILabel] = []
    var xPlacement: CGFloat = 70
    var labelNumber = 1
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    func setup() {
    while labelArray.count < componentCount {
    let labelFrame = CGRect(x: xPlacement, y: CGFloat(0), width: componentDimension, height: componentDimension)
    let label = UILabel(frame: labelFrame)
    label.tag = labelNumber
    label.font = UIFont(name: "bold system font", size: 64)
    label.text = "✯"
    label.textAlignment = .center
    label.textColor = componentInactiveColor
    self.addSubview(label)
    self.contentHorizontalAlignment = .center
    labelNumber += 1
    xPlacement += 16
    labelArray.append(label)
    }
    }
    
    required init?(coder acoder: NSCoder) {
        super.init(coder: acoder)
        setup()
        
    }
    
    //MARK: Tracking Mehods
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        sendActions(for: [.touchDown, .valueChanged])
        return true
    }
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: [.touchDragInside, .valueChanged])
            return true
        } else {
            sendActions(for: [.touchDragOutside])
            return false
        }
    }
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer{super.endTracking(touch, with: event)}
        guard let touch = touch else {return}
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: [.touchUpInside, .valueChanged])
        }
        sendActions(for: [.touchUpOutside])
    }
    override func cancelTracking(with event: UIEvent?) {
        super.cancelTracking(with: event)
        sendActions(for: .touchCancel)
    }
    
    func updateValue(at touch: UITouch) {
        for label in labelArray {
            print(label.tag)
            if label.bounds.contains((touch.location(in: label))) {
                switch label.textColor {
                case componentInactiveColor:
                    switch label.tag {
                    case 1:
                        label.textColor = componentActiveColor
                        CustomControl.value = label.tag
                        label.performFlare()
                        sendActions(for: .valueChanged)
                    case 2:
                        labelArray[0].textColor = componentActiveColor
                        label.textColor = componentActiveColor
                        CustomControl.value = label.tag
                        label.performFlare()
                        sendActions(for: .valueChanged)
                    case 3:
                        labelArray[0].textColor = componentActiveColor
                        labelArray[1].textColor = componentActiveColor
                        label.textColor = componentActiveColor
                        CustomControl.value = label.tag
                        label.performFlare()
                        sendActions(for: .valueChanged)
                    case 4:
                        labelArray[0].textColor = componentActiveColor
                        labelArray[1].textColor = componentActiveColor
                        labelArray[2].textColor = componentActiveColor
                        label.textColor = componentActiveColor
                        CustomControl.value = label.tag
                        label.performFlare()
                        sendActions(for: .valueChanged)
                    case 5:
                        labelArray[0].textColor = componentActiveColor
                        labelArray[1].textColor = componentActiveColor
                        labelArray[2].textColor = componentActiveColor
                        labelArray[3].textColor = componentActiveColor
                        label.textColor = componentActiveColor
                        CustomControl.value = label.tag
                        label.performFlare()
                        sendActions(for: .valueChanged)
                    default:
                        return
                    }
                default:
                    switch label.tag {
                    case 1:
                        labelArray[1].textColor = componentInactiveColor
                        labelArray[2].textColor = componentInactiveColor
                        labelArray[3].textColor = componentInactiveColor
                        labelArray[4].textColor = componentInactiveColor
                        CustomControl.value = label.tag
                        label.performFlare()
                        sendActions(for: .valueChanged)
                    case 2:
                        labelArray[2].textColor = componentInactiveColor
                        labelArray[3].textColor = componentInactiveColor
                        labelArray[4].textColor = componentInactiveColor
                        CustomControl.value = label.tag
                        label.performFlare()
                        sendActions(for: .valueChanged)
                    case 3:
                        labelArray[3].textColor = componentInactiveColor
                        labelArray[4].textColor = componentInactiveColor
                        CustomControl.value = label.tag
                        label.performFlare()
                        sendActions(for: .valueChanged)
                    case 4:
                        labelArray[4].textColor = componentInactiveColor
                        CustomControl.value = label.tag
                        label.performFlare()
                        sendActions(for: .valueChanged)
                    case 5:
                        label.textColor = componentActiveColor
                        CustomControl.value = label.tag
                        label.performFlare()
                        sendActions(for: .valueChanged)
                    default:
                        return
                    }
                }
            }
        }
    }
}
