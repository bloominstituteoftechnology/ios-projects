//
//  Friend+Convenience.swift
//  Friends
//
//  Created by Daniela Parra on 10/4/18.
//  Copyright © 2018 Daniela Parra. All rights reserved.
//

import Foundation
import CoreData

extension Friend {
    convenience init(name: String, bio: String, image: Data, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        
        self.init(context: context)
        self.name = name
        self.image = image
        self.bio = bio
    }
}
