
import UIKit

class ViewController: UIViewController {

    // MARK: - Reference properties
    
    let imageName = "Lambda_Logo_Full"
    lazy var logoImage = UIImage(named: imageName)
    lazy var logoImageView = UIImageView(image: logoImage!)

    
    // MARK: - Loading & Toggling
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.addSubview(logoImageView)
        createLabels()
        
        createLogo()
        
    }


    var shouldScramble: Bool = false
    
    @IBAction func toggle(_ sender: Any) {
        
        if shouldScramble == false {
            scatter()
        } else {
            gather()
        }
        
        shouldScramble = !shouldScramble
        
    }
    
    // MARK: - Label Construction
    
    var labelArray: [UILabel] = []
    
    let lambdaArray: [String] = ["L", "A", "M", "B", "D", "A"]
    
    func createLabels() {
        
        // Variable to increment spacing
        var count: CGFloat = 1.0
        
        let width: CGFloat = 60
        
        for eachLetter in lambdaArray {
            
            // Create label
            
            let lambdaLabel = UILabel()
            lambdaLabel.translatesAutoresizingMaskIntoConstraints = false
            
            let spacing: CGFloat = (width * count) + (8.0 * count)
            
            lambdaLabel.text = eachLetter
            
            lambdaLabel.font = UIFont.boldSystemFont(ofSize: 20)
            
            lambdaLabel.textColor = .black
            
            lambdaLabel.textAlignment = .center
            
            lambdaLabel.backgroundColor = .yellow
            
            view.addSubview(lambdaLabel)
            
            // Set constraints
            
            let widthConstraint = NSLayoutConstraint(item: lambdaLabel,
                                                     attribute: .width,
                                                     relatedBy: .equal,
                                                     toItem: nil,
                                                     attribute: .notAnAttribute,
                                                     multiplier: 1.0,
                                                     constant: 60)

            let heightConstraint = NSLayoutConstraint(item: lambdaLabel,
                                                     attribute: .height,
                                                     relatedBy: .equal,
                                                     toItem: lambdaLabel,
                                                     attribute: .width,
                                                     multiplier: 1.0,
                                                     constant: 0.0)
            
            let topConstraint = NSLayoutConstraint(item: lambdaLabel,
                                                   attribute: .top,
                                                   relatedBy: .equal,
                                                   toItem: view.safeAreaLayoutGuide,
                                                   attribute: .top,
                                                   multiplier: 1.0,
                                                   constant: spacing)
            
            let centerXConstraint = NSLayoutConstraint(item: lambdaLabel,
                                                       attribute: .centerX,
                                                       relatedBy: .equal,
                                                       toItem: view,
                                                       attribute: .centerX,
                                                       multiplier: 1.0,
                                                       constant: 0)

            NSLayoutConstraint.activate([widthConstraint, heightConstraint, topConstraint, centerXConstraint])
            
            labelArray.append(lambdaLabel)
            
            count += 1
            
        }
    }

    // MARK: - Image Construction
    
    func createLogo() {
        

        logoImageView.contentMode = .scaleAspectFit
        

        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let leadingConstraint = NSLayoutConstraint(item: logoImageView,
                                                 attribute: .leading,
                                                 relatedBy: .equal,
                                                 toItem: view,
                                                 attribute: .leading,
                                                 multiplier: 1.0,
                                                 constant: 8)
        
        let trailingConstraint = NSLayoutConstraint(item: view,
                                                    attribute: .trailing,
                                                    relatedBy: .equal,
                                                    toItem: logoImageView,
                                                    attribute: .trailing, multiplier: 1.0,
                                                    constant: 8)
        
        let bottomConstraint = NSLayoutConstraint(item: logoImageView,
                                                  attribute: .bottom,
                                                  relatedBy: .equal,
                                                  toItem: view.safeAreaLayoutGuide,
                                                  attribute: .bottom,
                                                  multiplier: 1.0,
                                                  constant: 60.0)
        
        NSLayoutConstraint.activate([leadingConstraint, trailingConstraint, bottomConstraint])
        
    }
    
    // MARK: - Animation Features
    
    func scatter() {
        
        UIView.animate(withDuration: 2) {
            
            // Fade out logo
            self.logoImageView.alpha = 0
            
            // Move letters to random locations and randomly rotate them
            // Assign random text color
            // Assign random background color
            
        }
        
    }
    
    func gather() {
        
        UIView.animate(withDuration: 2) {
            
            // Fade in logo
            self.logoImageView.alpha = 1.0
            
            // Reset text color and background color
            
            // Move letters back to original location and angle
            
        }

        
    }
    

    
}

