
import UIKit

@IBDesignable class ViewController: UIViewController {

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
            
            lambdaLabel.backgroundColor = .clear
            
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
        
        UIView.animate(withDuration: 3.0) {
            
            // Fade out logo
            self.logoImageView.alpha = 0
            
            for eachLabel in self.labelArray {
               
                // Move letters to random locations and randomly rotate them
                eachLabel.transform = CGAffineTransform(translationX: CGFloat(Int.random(in: -100...100)), y: CGFloat(Int.random(in: -300...300))).rotated(by: CGFloat.random(in: -3...3))
                
                // Assign random text color
                eachLabel.textColor = self.textColorArray.randomElement()
  
                
                // Assign random background color
                eachLabel.layer.backgroundColor = self.backgroundColorArray.randomElement()
                
                eachLabel.layer.cornerRadius = 30
            }

        }
    }
    
    func gather() {
        
        UIView.animate(withDuration: 3.0) {
            
            // Fade in logo
            self.logoImageView.alpha = 1.0
            
            for eachLabel in self.labelArray {
                // Reset text color and background color
                eachLabel.textColor = .black
                
                eachLabel.layer.backgroundColor = UIColor.clear.cgColor
                
                // Move letters back to original location and angle
                eachLabel.transform = CGAffineTransform.identity
            }
        }

        
    }
    
    // MARK: - Custom Colors
    
    let textColorArray: [UIColor] = [UIColor.coralOrange, UIColor.bluePurple, UIColor.russianViolet, UIColor.purpleNavy, UIColor.deepViolet, UIColor.myrtleGreen, UIColor.blackCoral]
    
    let backgroundColorArray: [CGColor] = [UIColor.teaGreen.cgColor, UIColor.mantis.cgColor, UIColor.aquamarine.cgColor, UIColor.magicMint.cgColor, UIColor.mediumAquamarine.cgColor, UIColor.paleGreen.cgColor, UIColor.lightCyan.cgColor, UIColor.paleGreen.cgColor, UIColor.turquoise.cgColor, UIColor.weldonBlue.cgColor, UIColor.darkSkyBlue.cgColor, UIColor.electricBlue.cgColor]
    

    
}



//let animation = CAKeyframeAnimation(keyPath: "backgroundColor")
//
//animation.values = [UIColor.lightCyan]
//
//animation.duration = 3.0
