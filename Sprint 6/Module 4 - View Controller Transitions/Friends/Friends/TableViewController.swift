//  Copyright © 2019 Frulwinn. All rights reserved.

import UIKit

class TableViewController: UITableViewController {
    
    var friends: [Friend] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        let friend1 = Friend(name: "Wonder Woman", friendImage: UIImage(named: "WonderWoman")!, info: "Amazonian masterful athlete, acrobat, fighter and strategist")
        
        let friend2 = Friend(name: "Spider Woman", friendImage: UIImage(named: "SpiderWoman")!, info: "Superhuman strength, speed, reflexes, agility, endurance and durability")
        
        let friend3 = Friend(name: "Jean Grey", friendImage: UIImage(named: "JeanGray")!, info: "telepathic and telekinetic abilities")
        
        friends.append(friend1)
        friends.append(friend2)
        friends.append(friend3)
    }

    // MARK: - Table view data source
       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as? TableViewCell else { fatalError("Unable to dequeue TableViewCell") }

        let friend = friends[indexPath.row]
        cell.friendView.image = friend.friendImage
        cell.nameLabel.text = friend.name
        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        
    }
}
