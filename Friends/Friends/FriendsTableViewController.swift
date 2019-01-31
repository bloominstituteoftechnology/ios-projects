//
//  FriendsTableViewController.swift
//  Friends
//
//  Created by Jocelyn Stuart on 1/31/19.
//  Copyright © 2019 JS. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
     //  navigationController.delegate = NavigationControllerDelegate()
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendsTableViewCell

        // Configure the cell...
        cell.nameLabel.text = "Jason Momoa"
        cell.imageView?.image = UIImage(named: "jason")

        return cell
    }
    

 

 
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    

}
