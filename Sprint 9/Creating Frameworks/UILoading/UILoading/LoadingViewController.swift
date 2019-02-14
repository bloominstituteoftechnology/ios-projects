
import UIKit

public class LoadingViewController: UIViewController {
    
    private let indeterminateLoadingView = IndeterminateLoadingView()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        indeterminateLoadingView.startAnimating()
        
    }
    
    
    
}
