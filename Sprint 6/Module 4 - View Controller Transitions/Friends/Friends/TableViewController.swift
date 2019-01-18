import UIKit

class TableViewController: UITableViewController, UIViewControllerTransitioningDelegate {
    
    let reuseIdentifier = "friendCell"
    
    var friends: [Friend] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let blossom = Friend(imageFriend: UIImage(named: "blossom")!, name: "Blossom", info: "Love flowers")
        
        let bubbles = Friend(imageFriend: UIImage(named: "bubbles")!, name: "Bubbles", info: "Love taking baths")
        
        let buttercup = Friend(imageFriend: UIImage(named: "buttercup")!, name: "Buttercup", info: "Loves cupcakes")
        
        friends.append(blossom)
        friends.append(bubbles)
        friends.append(buttercup)
    }

    // MARK: - Table view data source
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? TableViewCell else { fatalError("Unable to dequeue TableViewCell")}

        let friend = friends[indexPath.row]
        cell.friendView?.image = friend.imageFriend
        cell.nameLabel?.text = friend.name

        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.transitioningDelegate = self
//        guard let indexPath = tableView.indexPathForSelectedRow
//            else { return }
//        guard let destination = segue.destination as? DetailViewController
//            else { return }
//
//        destination.friend = friends[indexPath.row]
    }
}
