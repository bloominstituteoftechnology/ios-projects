

import UIKit

class CustomControl: UIControl {
    
    // Establish control as a value-providing and value-changing type
    var value: Int = 1
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        
        // Call function that does the setup work
        setup()
    }
    
    func setup() {
        
        var labelsArray: [UILabel] = []
        
        // Variable to increment spacing
        var count: CGFloat = 0.0
        
        for eachlabel in 1...5 {
            
            let spacing: CGFloat = (componentDimension * count) + (8.0 * count)
            
            let label = UILabel(frame: CGRect(x: spacing, y: 0.0, width: componentDimension, height: componentDimension))
            
            // Add label as a subview
            self.addSubview(label)
            
            // Add label to array
            labelsArray.append(label)
            
            // Tag label
            label.tag = eachlabel
        
            // Label characteristics
            label.text = "✮"
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.textAlignment = .center
            
            // First label has active color, the rest have the inactive color
            if label.tag > 1 {
                label.textColor = componentInactiveColor
            } else {
                label.textColor = componentActiveColor
            }

            // Increase count of label
            count += 1.0

        }
        
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
}
