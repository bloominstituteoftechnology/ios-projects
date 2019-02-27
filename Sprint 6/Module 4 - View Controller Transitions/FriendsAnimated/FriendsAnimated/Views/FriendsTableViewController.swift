//
//  FriendsTableViewController.swift
//  FriendsAnimated
//
//  Created by Angel Buenrostro on 1/31/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    let friendController = FriendController()

    @IBAction func logoutButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backItem?.hidesBackButton = true
        
        
        
        UserDefaults.standard.set("https://fluffy.es", forKey: "homepage")
        UserDefaults.standard.set(false, forKey: "darkmode")
        UserDefaults.standard.set(true, forKey: "user")
        
        let isUser = UserDefaults.standard.bool(forKey: "user")
                if isUser {
            print("user is true")
        }
        let library_path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]
        let appSupportPath = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true)[0]
        
        print("library path is \(library_path)")
        
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friendController.friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as! FriendsTableViewCell
        let friend = friendController.friends[indexPath.row]
        cell.friend = friend
        
        return cell
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cellSegue"{
            let cell = sender as! UITableViewCell
            guard let indexPath = tableView.indexPath(for: cell) else {return}
            let friend = friendController.friends[indexPath.row]
            let detailVC = segue.destination as! FriendDetailViewController
            detailVC.friendController = friendController
            detailVC.friend = friend
        }
        
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
