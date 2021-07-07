import UIKit

class TableViewController: UITableViewController, UIViewControllerTransitioningDelegate {

    let reuseIdentifier = "friendCell"
    
    var friends: [Friend] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let friend1 = Friend(imageFriend: UIImage(named: "cat")!, name: "Heather", info: "Hates running")
        
        let friend2 = Friend(imageFriend: UIImage(named: "dog")!, name: "Tim",  info: "Loves the Lakers")
        
        friends.append(friend1)
        friends.append(friend2)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? TableViewCell else { fatalError("unable to dequeue TableViewCell")}
        
        let friend = friends[indexPath.row]
        cell.friendView?.image = friend.imageFriend
        cell.nameLabel?.text = friend.name
        
        return cell
    }

//    MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow
            else { return }
        guard let destination = segue.destination as? DetailViewController
            else { return }
        
        destination.friend = friends[indexPath.row]
    }

}
