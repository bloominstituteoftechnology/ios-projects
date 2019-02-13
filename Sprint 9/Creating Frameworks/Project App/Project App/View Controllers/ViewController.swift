
import UIKit
import UILoading

class ViewController: UIViewController {
    
    @IBOutlet weak var beginOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        beginOutlet.tintColor = UIColor.lemonGlacier
        beginOutlet.layer.backgroundColor = UIColor.turquoise.cgColor
        beginOutlet.layer.cornerRadius = 50
        
    }
    
    @IBAction func beginAction(_ sender: Any) {
    }
    
    
}
