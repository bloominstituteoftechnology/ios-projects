//
//  FriendsDetailViewController.swift
//  FriendsTransitions
//
//  Created by Benjamin Hakes on 1/10/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

import UIKit

class FriendsDetailViewController: UIViewController {

    var friend: Friend?
    var delegate: NavigationControllerDelegate?
    
    @IBOutlet weak var headshotImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    @IBAction func swipeToDismiss(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .began:
            delegate?.interactionController = UIPercentDrivenInteractiveTransition()
            navigationController?.popViewController(animated: true)
        case .changed:
            let translation = sender.translation(in: view)
            let percentage = abs(translation.x / view.bounds.width)
            delegate?.interactionController?.update(percentage)
        case .ended:
            if sender.velocity(in: view).x > 1.0 {
                delegate?.interactionController?.finish()
            } else {
                delegate?.interactionController?.cancel()
            }
            
            delegate?.interactionController = nil
        default:
            break
        }
    }
    private func updateViews() {
        guard let friend = friend, isViewLoaded else { return }
        
        title = friend.name
        nameLabel.text = friend.name
        titleLabel.text = friend.title
        headshotImageView.image = friend.picture
        
        headshotImageView.layer.masksToBounds = true
    
    }

}
