//
//  ImageCollectionViewCell.swift
//  Astronomy ObjC Swift
//
//  Created by Benjamin Hakes on 3/5/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    override func prepareForReuse() {
        imageView.image = UIImage(named: "MarsPlaceholder")
        
        super.prepareForReuse()
    }
    
    @IBOutlet weak var imageView: UIImageView!
}
