
import Foundation
import UILoading

class TestLoadingViewController: UIViewController {
    
    @IBOutlet weak var loadingView: IndeterminateLoadingView!
    @IBOutlet weak var endOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.lemonGlacier
        loadingView.backgroundColor = UIColor.lemonGlacier
        
        shouldAnimate()
        
        endOutlet.tintColor = UIColor.smokeyBlack
        
//        loadingView.startAnimation()
//        loadingView.shouldStopAnimationOnNextCycle = false
        //loadingView.startAnimation()
    }
    
    func shouldAnimate() {
        loadingView.startAnimation()
    }
    @IBAction func endAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
    var loadingViewController = LoadingViewController()
    
    var indeterminateLoadingView = IndeterminateLoadingView()
    
}
