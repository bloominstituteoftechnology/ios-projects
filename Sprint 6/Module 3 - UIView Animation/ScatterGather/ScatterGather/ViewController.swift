//  Copyright © 2019 Frulwinn. All rights reserved.

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    var shouldScramble: Bool = false
    var labels: [UILabel] = []
    let logoView = UIImageView()
    
    func scramble() {
        shouldScramble = !shouldScramble
    }
    
    @IBAction func toggle(_ sender: Any) {
        scramble()
        if shouldScramble == true {
            for label in labels {
                scatter(label)
            }
            UIImageView.animate(withDuration: 2) {
                self.logoView.alpha = 1
            }
        } else {
            for label in labels {
                gather(label)
            }
            UIImageView.animate(withDuration: 2) {
                self.logoView.alpha = 0
            }
        }
    }
    
    func scatter(_ label: UILabel) {
        
        for label in labels {
            UIView.animate(withDuration: 3) {
                label.transform = CGAffineTransform(rotationAngle: CGFloat(self.randomInt(min: 1, max: 200)))
                label.transform = CGAffineTransform(scaleX: CGFloat(self.randomInt(min: 1, max: 4)), y: CGFloat(self.randomInt(min: 1, max: 4))).translatedBy(x: CGFloat(self.randomInt(min: 1, max: 4)), y: CGFloat(self.randomInt(min: 10, max: 40)))
                //label.frame = rect
                label.backgroundColor = self.getRandomColor()
                label.textColor = self.getRandomColor()
                
            }
        }
    }
    
    func gather(_ label: UILabel) {
        for label in labels {
            UIView.animate(withDuration: 1.5) {
                label.transform = .identity
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //adding all my labels programatically
        let lLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        lLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lLabel)
        lLabel.textAlignment = .center
        lLabel.text = "L"
        self.view.addSubview(lLabel)
        labels.append(lLabel)
        
        let aLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aLabel)
        aLabel.textAlignment = .center
        aLabel.text = "A"
        self.view.addSubview(aLabel)
        labels.append(aLabel)
        
        let mLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        mLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mLabel)
        mLabel.textAlignment = .center
        mLabel.text = "M"
        self.view.addSubview(mLabel)
        labels.append(mLabel)
        
        let bLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        bLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bLabel)
        bLabel.textAlignment = .center
        bLabel.text = "B"
        self.view.addSubview(bLabel)
        labels.append(bLabel)
        
        let dLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        dLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dLabel)
        dLabel.textAlignment = .center
        dLabel.text = "D"
        self.view.addSubview(dLabel)
        labels.append(dLabel)
        
        let lastALabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        lastALabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lastALabel)
        lastALabel.textAlignment = .center
        lastALabel.text = "A"
        self.view.addSubview(lastALabel)
        labels.append(lastALabel)
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        
        stackView.addArrangedSubview(lLabel)
        stackView.addArrangedSubview(aLabel)
        stackView.addArrangedSubview(mLabel)
        stackView.addArrangedSubview(bLabel)
        stackView.addArrangedSubview(dLabel)
        stackView.addArrangedSubview(lastALabel)
        
        let logoView = UIImageView()
        logoView.image = UIImage(named: "Lambda_Logo_Full")
        logoView.contentMode = .scaleAspectFit
        //logoView.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        logoView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            logoView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            logoView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            logoView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            logoView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            ])
    }
    
    //random position
    func randomInt(min: Int, max: Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
    
    //get random colors
    func getRandomColor() -> UIColor {
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 0.5)
    }
}

