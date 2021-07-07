//
//  TableViewController.swift
//  Friends
//
//  Created by Sergey Osipyan on 1/10/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, LabelProviding, UIViewControllerTransitioningDelegate {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        animateTable()
       navigationController?.delegate = navigationControllerDelegate
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    var friendName: UILabel!
    var friendImage: UIImageView!
    
    
    let navigationControllerDelegate = NavigationControllerDelegate()
    var friends = Friend()
    // MARK: - Table view data source
   
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friends.friends.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else { fatalError("No such cell")}

        cell.textLabel?.text = friends.friends[indexPath.row]
        cell.imageView?.image = friends.friendsImage[indexPath.row]
        

        return cell
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard
            let destinationDVC = segue.destination as? DetailViewController,
            let indexPath = tableView.indexPathForSelectedRow
            else { return }

        navigationControllerDelegate.sourceCell = tableView.cellForRow(at: indexPath) as? TableViewCell
        let index = indexPath.row
        destinationDVC.index = index
        friendName = tableView.cellForRow(at: indexPath)?.textLabel
        friendImage = tableView.cellForRow(at: indexPath)?.imageView
    }
    func animateTable() {
        tableView.reloadData()
        let cells = tableView.visibleCells
        
        let tableViewHeight = tableView.bounds.size.height
        
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
        }
        
        var delayCounter = 0
        for cell in cells {
            UIView.animate(withDuration: 1.75, delay: Double(delayCounter) * 0.05, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            delayCounter += 1
        }
    }
  
}
