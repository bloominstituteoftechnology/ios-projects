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
        let count: CGFloat = 0.0
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
}
