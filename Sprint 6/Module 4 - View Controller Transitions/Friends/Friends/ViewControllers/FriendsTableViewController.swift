//
//  FriendsTableViewController.swift
//  Friends
//
//  Created by De MicheliStefano on 30.08.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController, UIViewControllerTransitioningDelegate {
    
    var friends: [Friend] = []
    var navigationControllerDelegate = NavigationControllerDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeFriends()
        navigationController?.delegate = navigationControllerDelegate
    }
    
    // MARK: - Private Methods
    
    private func initializeFriends() {
        let friend1 = Friend(name: "Stefano", description: "Cool dude", image: UIImage(named: "stefano")!)
        let friend2 = Friend(name: "Hua", description: "Cool girl", image: UIImage(named: "hua")!)
        friends.append(friend1)
        friends.append(friend2)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendCellTableViewCell

        cell.friend = friends[indexPath.row]

        return cell
    }
     
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.transitioningDelegate = self
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        navigationControllerDelegate.sourceCell = tableView.cellForRow(at: indexPath) as! FriendCellTableViewCell

    }

}
