//
//  FriendsTableViewController.swift
//  Friends
//
//  Created by Dillon McElhinney on 10/4/18.
//  Copyright © 2018 Dillon McElhinney. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    var friends: [Friend] = []
    let delegate = NavigationControllerDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.delegate = delegate

        let friend1 = Friend(name: "Dillon", imageData: UIImage(named: "Dillon")?.jpegData(compressionQuality: 0.8), description: "Student in Lambda School's iOS program.")
        friends.append(friend1)
    }

    // MARK: - Table View Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath)
        let friend = friends[indexPath.row]
        
        cell.textLabel?.text = friend.name
        
        if let imageData = friend.imageData {
            cell.imageView?.image = UIImage(data: imageData)
        }

        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowFriendSegue" {
            let destinationVC = segue.destination as! FriendDetailViewController
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let friend = friends[indexPath.row]
            
            delegate.sourceCell = tableView.cellForRow(at: indexPath)
            destinationVC.friend = friend
        }
    }

}
