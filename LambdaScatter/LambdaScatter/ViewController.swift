//
//  ViewController.swift
//  LambdaScatter
//
//  Created by Jocelyn Stuart on 1/30/19.
//  Copyright © 2019 JS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var shouldToggle: Bool = true
    
    
    @IBAction func toggle(_ sender: UIBarButtonItem) {
        if shouldToggle == true {
            scatter()
            shouldToggle = false
        } else {
            gather()
            shouldToggle = true
        }
    }
    
    // Create Labels
   
    
    var labelArray: [UILabel] = []
    
    func setLabels() {
        var count: CGFloat = 0.0
        while labelArray.count <= 6 {
            count += 40.0
            var newLabel = UILabel(frame: CGRect(x: count, y: 100.0, width: 80, height: 80))
            
            if count == 40 {
                newLabel.text = "L"
            } else if count == (40*2){
                newLabel.text = "a"
            } else if count == (40*3){
                newLabel.text = "m"
            } else if count == (40*4){
                newLabel.text = "b"
            } else if count == (40*5) {
                newLabel.text = "d"
            } else if count == (40*6) {
                newLabel.text = "a"
            }
            newLabel.textAlignment = .center
            newLabel.font = UIFont(name: "Noteworthy", size: 60)
            
            labelArray.append(newLabel)
            newLabel.tag = self.labelArray.count
            view.addSubview(newLabel)
          
        }
    }
    
    func scatter() {
        
    }
    
    func gather() {
        
    }
    

}

