//
//  ViewController.swift
//  Friends
//
//  Created by Sergey Osipyan on 1/10/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, LabelProviding, UIViewControllerTransitioningDelegate {
    

  
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
    }
    var friend = Friend()
    var index: Int?
   

    @IBOutlet weak var friendImage: UIImageView!
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var friendPositinInLambda: UILabel!
    
    func update() {
        guard let index = index else { return }
        friendName.text = friend.friends[index]
        friendName.font = UIFont(name: "Neuropol X", size: 20)
        friendPositinInLambda.text = friend.friednsPositionInLambda[index]
        friendImage.image = friend.friendsImage[index]
        navigationItem.title = friend.friends[index]
    }
    
    
}
