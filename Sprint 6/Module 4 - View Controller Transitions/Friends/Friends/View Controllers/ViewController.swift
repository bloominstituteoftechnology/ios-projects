//
//  ViewController.swift
//  Friends
//
//  Created by Nikita Thomas on 11/15/18.
//  Copyright © 2018 Nikita Thomas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    var friend: Friend?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        guard let friend = friend else { return }
        
        self.title = friend.name
        imageView.image = UIImage(named: friend.image)
        nameLabel.text = friend.name
        detailLabel.text = friend.detail
    }


}

