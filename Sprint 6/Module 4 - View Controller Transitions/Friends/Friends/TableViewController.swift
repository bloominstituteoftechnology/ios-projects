import UIKit

class TableViewController: UITableViewController, UIViewControllerTransitioningDelegate {

    let reuseIdentifier = "friendCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.shared.count()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? TableViewCell else { fatalError("unable to dequeue TableViewCell")}
        
        let contact = Model.shared.contact(forIndex: indexPath.row)
        //cell.friendView.image = contact.image
        cell.nameLabel.text = contact.name
        return cell
    }

//    MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.transitioningDelegate = self
    }

}
