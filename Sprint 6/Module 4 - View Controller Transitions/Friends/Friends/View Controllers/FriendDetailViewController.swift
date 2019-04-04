//
//  FriendDetailViewController.swift
//  Friends
//
//  Created by Moses Robinson on 1/31/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

import UIKit

class FriendDetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    private func updateViews() {
        guard let friend = friend else { return }
        
        title = friend.name.capitalized
        friendImage.image = friend.image
        friendName.text = friend.name.capitalized
        friendInfo.text = friend.info
    }
    
    @IBAction func panBack(_ sender: UIPanGestureRecognizer) {
        
        switch sender.state {
            
        case .began:
            
            interactionController = UIPercentDrivenInteractiveTransition()
            navigationController?.popViewController(animated: true)
            
        case .changed:
            
            let translation = sender.translation(in: view)
            
            let percentageComplete = abs(translation.x / view.bounds.width)
            
            interactionController?.update(percentageComplete)
            
        case .ended:
            
            let velocity = sender.velocity(in: view).x
            
            if velocity > 100 {
                interactionController?.finish()
            } else {
                interactionController?.cancel()
            }
        default:
            break
        }
    }
    
    // MARK: - Propeties
    
    let animator = ImageTransitionAnimator()
    
    private var interactionController: UIPercentDrivenInteractiveTransition?
    
    var friendController: FriendController?
    var friend: Friend?
    
    @IBOutlet weak var friendImage: UIImageView!
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var friendInfo: UILabel!
}
