//
//  FriendsTableViewController.swift
//  Friends
//
//  Created by Moin Uddin on 10/4/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {

    let navigationControllerDelegate = NavigationControllerDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.delegate = navigationControllerDelegate
    }



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friendController.friends.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendTableViewCell else { return UITableViewCell() }
        let friend = friendController.friends[indexPath.row]
        cell.friend = friend
        // Configure the cell...

        return cell
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "viewFriend" {
            guard let destVC = segue.destination as? FriendDetailViewController else { return }
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let friend = friendController.friends[indexPath.row]
            guard let friendTableViewCell = tableView.cellForRow(at: indexPath) as? FriendTableViewCell else { return }
            navigationControllerDelegate.sourceCell = friendTableViewCell
            destVC.friend = friend
        }
    }
    
    let friendController = FriendController()
 

}
