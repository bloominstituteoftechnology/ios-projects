//
//  TableViewController.swift
//  Friends
//
//  Created by Nikita Thomas on 11/15/18.
//  Copyright © 2018 Nikita Thomas. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var friends: [Friend] = []
    let navigationControllerDelegate = NavigationControllerDelegate()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let friend = Friend(name: "Elon Musk", detail: "Will get me a free Tesla", image: "elon_image")
        friends.append(friend)
        
        navigationController?.delegate = navigationControllerDelegate
        
    }
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let friend = friends[indexPath.row]
        
        cell.friendImage.image = UIImage(named: friend.image)
        cell.nameLabel.text = friend.name
        
        return cell
    }

    // MARK: - Navigation

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let cell = tableView.cellForRow(at: indexPath) as! TableViewCell
        
        navigationControllerDelegate.sourceCell = cell
        
        let viewC = segue.destination as! ViewController
        viewC.friend = friends[indexPath.row]
        
    }
    

}
