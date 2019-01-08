
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
    
    func setup() {
        
        var subviewArray: [UILabel] = []
        
        // Create 5 labels
        for each in 1 ... 5 {
            
            // New variable to hold the changing componentDimension
            var componentDimensionIncrease = componentDimension + 8
            
            // Create the labels
            let rect = CGRect(x: 8.0, y: 0, width: (componentDimensionIncrease), height: componentDimension)
            let label = UILabel(frame: rect)
            
            // Set label's physical characteristics
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.text = "⭐︎"
            label.textAlignment = .center
            label.textColor = componentInactiveColor
            subviewArray[0].textColor = componentActiveColor
            
            // Add a tag for each view to represent which star it is
            var tag: Int { get }
            
            // Add each label as a subview
            viewController.view.addSubview(label)
            
            // Store each label into a local array
            subviewArray.append(label)

            
            // Add padding of 8.0 between each label
            componentDimensionIncrease += 8
        }
        
    }
    
    // Tells Auto Layout how big the custom control should be
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
}
