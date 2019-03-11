//
//  ImageCollectionViewCell.swift
//  Astronomy-ObjC
//
//  Created by TuneUp Shop  on 3/4/19.
//  Copyright © 2019 jkaunert. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = #imageLiteral(resourceName: "MarsPlaceholder")
    }
    
    // MARK: Properties
    
    // MARK: IBOutlets
    
    @IBOutlet var imageView: UIImageView!
}
