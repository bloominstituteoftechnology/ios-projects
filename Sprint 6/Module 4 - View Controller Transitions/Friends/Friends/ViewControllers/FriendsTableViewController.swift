//
//  FriendsTableViewController.swift
//  Friends
//
//  Created by Lisa Sampson on 8/30/18.
//  Copyright © 2018 Lisa Sampson. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.delegate = navigationControllerDelegate
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendController.friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendsTableViewCell
        
        cell.friend = friendController.friends[indexPath.row]

        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! DetailViewController
        
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        detailVC.friend = friendController.friends[indexPath.row]
        
        guard let cell = tableView.cellForRow(at: indexPath) as? FriendsTableViewCell else { return }
        
        navigationControllerDelegate.sourceCell = cell
    }
    
    let friendController = FriendController()
    let navigationControllerDelegate = NavigationControllerDelegate()
}
