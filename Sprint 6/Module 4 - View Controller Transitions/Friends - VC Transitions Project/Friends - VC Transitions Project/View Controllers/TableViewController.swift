

import UIKit

class TableViewController: UITableViewController {
    
    // Number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FriendModel.shared.friendArray.count
    }
    
    // Cell contents
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let karly = Friend(name: "Karly", bio: "Running Coach, Founder of Public Run Club \n Currently living in Tanzania")
//        let kate = Friend(name: "Kate", bio: "Sister, Founder of Ibis Bakery \n Currently living in Kansas City")
//        let meredith = Friend(name: "Meredith", bio: "Sister, Refugee Resettlement \n Currently living in India")
//        let justine = Friend(name: "Justine", bio: "Marketing Coordinator at DD Ford Construction, \n Currently living in Austin, TX")
//        
//        FriendModel.shared.friendArray.append(karly)
//        FriendModel.shared.friendArray.append(kate)
//        FriendModel.shared.friendArray.append(meredith)
//        FriendModel.shared.friendArray.append(justine)
        
        // Cast the cell as the Table View Cell
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier, for: indexPath) as! TableViewCell
        
        // Get the person that will be associated with this row
        let friend = FriendModel.shared.friendArray[indexPath.row]
        
        // Display name of corresponding friend object
        cell.friend = friend

        return cell
    }
    
    
}
