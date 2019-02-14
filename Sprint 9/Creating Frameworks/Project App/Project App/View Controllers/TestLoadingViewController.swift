
import Foundation
import UILoading

class TestLoadingViewController: UIViewController {
    
    @IBOutlet weak var loadingView: IndeterminateLoadingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadingView.startAnimating()
        
        
    }
    
    private var loadingViewController = LoadingViewController()
    
    var indeterminateLoadingView = IndeterminateLoadingView()
    
}
