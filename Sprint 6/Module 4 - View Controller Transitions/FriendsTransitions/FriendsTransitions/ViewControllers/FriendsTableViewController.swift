//
//  FriendsTableViewController.swift
//  FriendsTransitions
//
//  Created by Benjamin Hakes on 1/10/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController, UINavigationControllerDelegate {
    
    var delegate = NavigationControllerDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "FriendsTableViewCell", bundle: nil), forCellReuseIdentifier: "friendsCell")
        navigationController?.delegate = delegate
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Model.shared.friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "friendsCell", for: indexPath) as? FriendsTableViewCell else {fatalError("failed to dequeueReusableCell")}
        let friend = Model.shared.friends[indexPath.row]
        
        // Configure the cell...
        cell.imageView?.image = friend.picture
        cell.nameLabel.text = friend.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "friendsCell", for: indexPath) as? FriendsTableViewCell else {fatalError("failed to dequeueReusableCell")}
        
        performSegue(withIdentifier: "showFriendSegue", sender: cell)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showFriendSegue"{
            guard let destVC = segue.destination as? FriendsDetailViewController else {fatalError("could not detailed VC")}
            guard let indexPath = tableView.indexPathForSelectedRow else {fatalError("could not access indexPath for selected row")}
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "friendsCell", for: indexPath) as? FriendsTableViewCell else {fatalError("failed to dequeueReusableCell")}
            let friend = Model.shared.friends[indexPath.row]
            
            delegate.sourceCell = cell
            destVC.friend = friend
            destVC.delegate = delegate
        }
    
        
    }
    
}
