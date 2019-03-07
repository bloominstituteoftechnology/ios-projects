//
//  OSIViewController.swift
//  Objc Mars Rover
//
//  Created by Sergey Osipyan on 3/4/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

import UIKit

class OSIViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
      let oSIMarsRoverClient = OSIMarsRoverClient()
        
        
        oSIMarsRoverClient.search(forRover: "curiosity") { rover, error in
            
        
        }
       
  //    oSIMarsRoverClient.search(forPhotos: "curiosity", sol: 1)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
