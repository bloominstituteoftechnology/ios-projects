//
//  FriendsTableViewController.swift
//  Friends
//
//  Created by Jocelyn Stuart on 1/31/19.
//  Copyright © 2019 JS. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        friendController.createFriend(withName: "Jason", andDetails: "Professional Actor", andPic: UIImage(named: "jason")!)
        
        navigationController?.delegate = NavigationControllerDelegate()
    }
    
  
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friendController.friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendsTableViewCell
        
       /* cell.nameLabel.text = "Jason Momoa"
        cell.profileImage.image = UIImage(named: "jason")
        cell.detailTextLabel?.text = "Professional Actor"*/

       
        let friend = friendController.friends[indexPath.row]
        cell.friend = friend
        
        
        return cell
    }
    

 

 
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FriendDetail" {
            
            guard let friendDetailVC = segue.destination as? DetailViewController,
                let cell = sender as? FriendsTableViewCell else { return }
            
            friendDetailVC.friend = cell.friend
            
            //navigationController?.delegate = cell.friend
        }
            
               // detailController.recipe = recipes[recipeIndex]
        }
    
    
     let friendController = FriendController()
    
    }
    



