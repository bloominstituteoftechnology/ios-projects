//
//  FriendDetailViewController.swift
//  FriendsAnimated
//
//  Created by Angel Buenrostro on 1/31/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

import UIKit

class FriendDetailViewController: UIViewController {
    
    var friend: Friend?
    
    var friendController: FriendController?
    
    

    @IBOutlet weak var detailTitle: UINavigationItem!
    
    @IBOutlet weak var friendImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        // Do any additional setup after loading the view.
    }
    
    
    func updateViews(){
        guard let friend = friend else { print("No friend found in detailVC") ; return}
            detailTitle.title = friend.name
            nameLabel.text = friend.name
            detailLabel.text = friend.detail
            friendImage.image = friend.image
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
