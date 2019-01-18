
import UIKit

class TableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FriendModel.shared.createFriend()
        
        // Set the navigationController's delegate to an instance of the NavigationControllerDelegate()
        navigationController?.delegate = navigationControllerDelegate
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FriendModel.shared.numberOfFriends()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Cast cell as TableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier, for: indexPath) as! TableViewCell
        
        // Get the friend associated with cell
        let friend = FriendModel.shared.friend(at: indexPath.row)
        
        // Pass the model object to the cell
        cell.friend = friend
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard
            let destination = segue.destination as? DetailViewController,
            let indexPath = tableView.indexPathForSelectedRow
            else { return }
        
        // Pass the friend that corresponds to tapped cell
        let friend = FriendModel.shared.friendArray[indexPath.row]
        destination.friend = friend
        
        // Get the tapped row and use it to give the navigation controller delegate the source table view cell (Set the source cell as the tapped table view cell)
        navigationControllerDelegate.sourceCell = tableView.cellForRow(at: indexPath)!
        
        
    }
    
    // Create a strong reference to the NavigationControllerDelegate class
    let navigationControllerDelegate = NavigationControllerDelegate()
    
}
