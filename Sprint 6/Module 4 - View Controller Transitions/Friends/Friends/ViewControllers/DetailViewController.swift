//
//  DetailViewController.swift
//  Friends
//
//  Created by Lisa Sampson on 8/30/18.
//  Copyright © 2018 Lisa Sampson. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    func updateViews() {
        guard let friend = friend else { return }
        
        self.title = friend.name
        imageView.image = friend.image
        nameLabel.text = friend.name
        jobLabel.text = friend.job
    }
    
    var friend: Friend?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
}
