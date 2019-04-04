//
//  FriendTableViewController.swift
//  Friends
//
//  Created by Moses Robinson on 1/31/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

import UIKit

class FriendTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.delegate = navigationControllerDelegate
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return friendController.friends.count
    }
    
    let reuseIdentifier = "FriendCell"
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
        let friend = friendController.friends[indexPath.row]
        
        cell.textLabel?.text = friend.name.capitalized
        cell.imageView?.image = friend.image
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FriendDetail" {
            guard let destination = segue.destination as? FriendDetailViewController,
                let indexPath = tableView.indexPathForSelectedRow else { return }
            let cell = tableView.cellForRow(at: indexPath)
            
            destination.friendController = friendController
            destination.friend = friendController.friends[indexPath.row]
            
            navigationControllerDelegate.sourceCell = cell
        }
    }
    
    // MARK: - Properties
    
    let friendController = FriendController()
    
    let navigationControllerDelegate = NavigationControllerDelegate()
}
