//  Copyright © 2019 Frulwinn. All rights reserved.

import UIKit

class CustomControl: UIControl {
    
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
        
    }
}
