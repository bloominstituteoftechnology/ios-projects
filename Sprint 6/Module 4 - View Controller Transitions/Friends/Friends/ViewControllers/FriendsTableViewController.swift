//
//  FriendsTableViewController.swift
//  Friends
//
//  Created by De MicheliStefano on 30.08.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController, UIViewControllerTransitioningDelegate, UINavigationControllerDelegate {
    
    var friends: [Friend] = []
    var selectedFriendCell: FriendCellTableViewCell?
    var navigationControllerDelegate = NavigationControllerDelegate()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.delegate = navigationControllerDelegate
    }
    
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
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let friendCell = tableView.cellForRow(at: indexPath) as? FriendCellTableViewCell
        selectedFriendCell = friendCell
        navigationControllerDelegate.sourceCell = friendCell
    }

}
