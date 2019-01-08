import Foundation
import UIKit

class CustomControl: UIControl {
    
    static let value: Int = 1
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
        
    }
    
    
    func setup(){
        
        var labelArray: [UILabel] = []
        var layoutX: CGFloat = 8.0
        for label in 1...5 {
            let testLabel = UILabel(frame: CGRect(x: layoutX, y: 0, width: componentDimension, height: componentDimension))
            //testLabel.center = CGPoint(x: layoutX, y: 0)
            layoutX += componentDimension + 8.0
            print(layoutX)
            testLabel.tag = label
            print(testLabel.tag)
            testLabel.font = UIFont.boldSystemFont(ofSize: 32.0)
            testLabel.textAlignment = .center
            testLabel.text = "\u{2736}"
            labelArray.append(testLabel)
            addSubview(testLabel)
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    
    
    
}
