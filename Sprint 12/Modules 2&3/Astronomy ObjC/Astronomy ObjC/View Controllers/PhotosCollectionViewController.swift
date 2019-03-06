//
//  PhotosCollectionViewController.swift
//  Astronomy ObjC
//
//  Created by Lisa Sampson on 3/4/19.
//  Copyright © 2019 Lisa M Sampson. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    let solLabel = UILabel()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // TODO: - Implement
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // TODO: - Implement
        return UICollectionViewCell()
    }
    
    
}
