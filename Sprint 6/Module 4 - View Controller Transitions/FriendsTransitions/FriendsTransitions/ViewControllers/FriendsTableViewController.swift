//
//  FriendsTableViewController.swift
//  FriendsTransitions
//
//  Created by Benjamin Hakes on 1/10/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "FriendsTableViewCell", bundle: nil), forCellReuseIdentifier: "friendsCell")
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Model.shared.friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "friendsCell", for: indexPath) as? FriendsTableViewCell else {fatalError("failed to dequeueReusableCell")}

        // Configure the cell...
        cell.imageView?.image = Model.shared.friends[indexPath.row].picture
        cell.nameLabel.text = Model.shared.friends[indexPath.row].name
        
        
        return cell
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        print("Here")
        guard let indexPath = tableView.indexPathForSelectedRow else {fatalError("could not access indexPath for selected row")}
        guard let destVC = segue.destination as? FriendsDetailViewController else { return }
        
        destVC.title = Model.shared.friends[indexPath.row].name
        destVC.nameLabel.text = Model.shared.friends[indexPath.row].name
        destVC.titleLabel.text = Model.shared.friends[indexPath.row].title
        destVC.headshotImageView.image = Model.shared.friends[indexPath.row].picture
    }

}
