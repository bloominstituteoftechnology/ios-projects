

import UIKit

class TableViewController: UITableViewController {
    
    // Table View's initial load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FriendModel.shared.createFriend()
    }
    
    // Reload when we return from the detail view
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // Number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FriendModel.shared.friendArray.count
    }
    
    // Cell contents
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Cast the cell as the Table View Cell
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier, for: indexPath) as! TableViewCell
        
        // Get the person that will be associated with this row
        let friend = FriendModel.shared.friendArray[indexPath.row]
        
        // Display name of corresponding friend object
        cell.friend = friend

        return cell
    }
    
    // Prepare for segue between Table View Controller and Detail View Controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destination
        guard
            let destination = segue.destination as? DetailViewController,
            let indexPath = tableView.indexPathForSelectedRow
            else { return }
            
        // Pass the friend that corresponds with the indexPath that was tapped to the new view controller
        let friend = FriendModel.shared.friendArray[indexPath.row]
        destination.friend = friend
        
        
    }
    
    
}
