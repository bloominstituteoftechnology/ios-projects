//
//  UIView+Extension.swift
//  Stars Control
//
//  Created by Moin Uddin on 10/2/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

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
