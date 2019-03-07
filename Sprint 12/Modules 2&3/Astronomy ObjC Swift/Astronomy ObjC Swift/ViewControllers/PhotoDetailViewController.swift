//
//  PhotoDetailViewController.swift
//  Astronomy ObjC Swift
//
//  Created by Benjamin Hakes on 3/5/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    // MARK: - Private Methods
    
    private func updateViews(){
        
    }
    
    private func presentSuccessfulSaveAlert() {
        let alert = UIAlertController(title: "Photo Saved!", message: "The photo has been saved to your Photo Library!", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        
        alert.addAction(okayAction)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - IBActions
    @IBAction func save(_ sender: Any) {
        
    }
    // MARK: - Properties
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var cameraLabel: UILabel!
//    var photo: MarsPhotoReference? {
//        didSet {
//            updateViews()
//        }
//    }
    
}
