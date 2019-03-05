//
//  NSString+SafeNetworking.swift
//  ios-astronomy-objc
//
//  Created by Austin Cole on 3/5/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import Foundation

extension String {
    ///Insert an 's' into an unsecure URL string for secure networking
    func secureURLString() -> String {
        var newString = self
        let neededIndex = newString.index(newString.startIndex, offsetBy: 4)
        newString.insert("s", at: neededIndex)
        return newString
    }
}

