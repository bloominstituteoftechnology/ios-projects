//
//  FriendTableViewController.swift
//  Friends Animation
//
//  Created by Iyin Raphael on 10/4/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit

class FriendTableViewController: UITableViewController {



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath)
        let friend = friendController.friends[indexPath.row]
        cell.imageView?.image = friend.image
        cell.textLabel?.text = friend.name
        return cell
    }
    

    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    }
    
    
    var friendController = FriendController()

}
