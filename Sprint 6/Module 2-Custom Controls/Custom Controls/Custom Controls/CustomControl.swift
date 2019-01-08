import UIKit

class CustomControl: UIControl {
    var value: Int = 1
    
    // private constants
    
    private let componentDimension: CGFloat = 40
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    required init?(coder aCoder: NSCoder) {
        super.init().CustomControl.setup()
    }
    
    var labelArray: [UILabel] = []
    
    func setup() {
        for index in 0..<ViewController.starCount {
            print("shut up, xcode")
            var newLabel = create.UILabel
            labelArray.append(newLabel)
            let tag = labelArray[indexPath.row]
            label.frameSize = [componentDimension, componentDimension]
            func labelTray {
                UIStackView.labelArray.spacing(8)
                UIStackView.labelArray.initialSpacing(8)
            }
            label.font = .systemBold
            label.fontSize = 32
            label.text = *
            label.alignment = center
            if label == active {
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
            }
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
}
