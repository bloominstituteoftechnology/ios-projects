//
//  ViewController.swift
//  Friends
//
//  Created by Sergey Osipyan on 1/10/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, LabelProviding, UIViewControllerTransitioningDelegate {
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        update()
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenEdgeSwiped))
        edgePan.edges = .left
        
        view.addGestureRecognizer(edgePan)
    }
    
    @objc func screenEdgeSwiped(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        if recognizer.state == .recognized {
            print("Screen edge swiped!")
            
        }
    }
    var friend = Friend()
    var index: Int?
   
    @IBAction func handlePan(_ gestureRecognizer: UIPanGestureRecognizer) {
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            
            let translation = gestureRecognizer.translation(in: self.view)
            // note: 'view' is optional and need to be unwrapped
            gestureRecognizer.view!.center = CGPoint(x: gestureRecognizer.view!.center.x + translation.x, y: gestureRecognizer.view!.center.y + translation.y)
            gestureRecognizer.setTranslation(CGPoint.zero, in: self.view)
        }
    }

    @IBOutlet weak var friendImage: UIImageView!
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var friendPositinInLambda: UILabel!
    
    func update() {
        guard let index = index else { return }
        friendName.text = friend.friends[index]
        friendName.font = UIFont(name: "Neuropol X", size: 20)
        friendPositinInLambda.text = friend.friednsPositionInLambda[index]
        friendImage.image = friend.friendsImage[index]
        navigationItem.title = friend.friends[index]
    }
}
