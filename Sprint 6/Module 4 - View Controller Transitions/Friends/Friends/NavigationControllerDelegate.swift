//  Copyright © 2019 Frulwinn. All rights reserved.

import UIKit

class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
    
    var sourceCell: TableViewCell
    
    func navigationController(_ navigationController:, animationControllerFor:, from:, to:) {
        return animator
    }
    
    let animator = Animator()
}
