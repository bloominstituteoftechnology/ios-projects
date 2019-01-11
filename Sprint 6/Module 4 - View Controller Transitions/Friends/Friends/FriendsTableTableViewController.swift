//
//  FriendsTableTableViewController.swift
//  Friends
//
//  Created by Austin Cole on 1/10/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import UIKit

class FriendsTableTableViewController: UITableViewController, UIViewControllerTransitioningDelegate {
    let navConDel = NavigationControllerDelegate()
    var nameLabel: UILabel?
    var imageView: UIImageView?
    
    let friends = [Friend(name: "Austin Cole", occupation: "iOS4 Student", image: UIImage(named: "20190106_160712")!),Friend(name: "Austin Cole's Identical Twin", occupation: "Barbershop Inspector", image: UIImage(named: "20190106_160712")!)]

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.delegate = navConDel

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.imageView?.image = friends[indexPath.row].image
        cell.textLabel?.text = friends[indexPath.row].name
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        guard let destination = segue.destination as? ViewController else { return }
        navConDel.sourceCell = tableView.cellForRow(at: indexPath) as? FriendTableViewCell
        destination.friend = friends[indexPath.row]
        imageView = tableView.cellForRow(at: indexPath)?.imageView
        nameLabel = tableView.cellForRow(at: indexPath)?.textLabel
        
    }

}
