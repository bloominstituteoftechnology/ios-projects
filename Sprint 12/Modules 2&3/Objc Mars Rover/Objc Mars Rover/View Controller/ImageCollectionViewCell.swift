//
//  ImageCollectionViewCell.swift
//  Astronomy
//
//  Created by Andrew R Madsen on 9/5/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = UIImage(named: "MarsPlaceholder")
    }
    
    // MARK: Properties
    
    // MARK: IBOutlets
    
    @IBOutlet weak var photoLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
}
