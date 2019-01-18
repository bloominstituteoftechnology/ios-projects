//
//  TableViewController.swift
//  Friends
//
//  Created by Ivan Caldwell on 1/17/19.
//  Copyright © 2019 Ivan Caldwell. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UIViewControllerTransitioningDelegate {

//    let buffett = Friend(name: "Warren Buffet", title: "CEO of Berkshire Hathaway", image: UIImage(named: "WarrenBuffett")!)
//    let gates = Friend(name: "Bill Gates", title: "CEO of Microsoft", image: UIImage(named: "BillGates")!)
//    let bezos = Friend(name: "Jeff Bezos", title: "CEO of Amazon", image: UIImage(named: "JeffBezos")!)
//    let zuckerberg = Friend(name: "Mark Zuckerberg", title: "CEO of Facebook", image: UIImage(named: "MarkZuckerberg")!)
//    let friends = [buffett, gates, bezos, zuckerberg]
    
    let friends = [Friend(name: "Warren Buffet", title: "CEO of Berkshire Hathaway", image: UIImage(named: "WarrenBuffett")!),
                   Friend(name: "Bill Gates", title: "CEO of Microsoft", image: UIImage(named: "BillGates")!),
                   Friend(name: "Jeff Bezos", title: "CEO of Amazon", image: UIImage(named: "JeffBezos")!),
                   Friend(name: "Mark Zuckerberg", title: "CEO of Facebook", image: UIImage(named: "MarkZuckerberg")!)]

    
    let navigationControllerDelegate = NavigationControllerDelegate()
    var nameLabel: UILabel?
    var titleLabel: UILabel?
    var imageView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = friends[indexPath.row].name
        cell.detailTextLabel?.text = friends[indexPath.row].title
        cell.imageView?.image = friends[indexPath.row].image
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        guard let destination = segue.destination as? ViewController else { return }
        destination.friend = friends[indexPath.row]
        navigationControllerDelegate.sourceCell = tableView.cellForRow(at: indexPath) as? TableViewCell

        nameLabel = tableView.cellForRow(at: indexPath)?.textLabel
        titleLabel = tableView.cellForRow(at: indexPath)?.detailTextLabel
        imageView = tableView.cellForRow(at: indexPath)?.imageView
    }
    

}
