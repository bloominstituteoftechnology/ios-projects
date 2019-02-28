//
//  FriendDetailViewController.swift
//  Friends
//
//  Created by De MicheliStefano on 30.08.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

import UIKit

class FriendDetailViewController: UIViewController, UIViewControllerTransitioningDelegate, UINavigationControllerDelegate {
    
    let animator = ImageTransitionAnimator()
    var navigationControllerDelegate = NavigationControllerDelegate()
    
    var selectedFriendCell: FriendCellTableViewCell? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var descript: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.delegate = self
    }
    
    private func updateViews() {
        name?.text = selectedFriendCell?.name.text
        profileImage?.image = selectedFriendCell?.profileImage.image
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        animator.friendCell = selectedFriendCell
        animator.isBackAnimation = true
        
        return animator
    }
    
    override func unwind(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
        let friendsTVC = subsequentVC as! FriendsTableViewController
        friendsTVC.selectedFriendCell = selectedFriendCell
        navigationControllerDelegate.sourceCell = selectedFriendCell
        navigationControllerDelegate.isBackAnimation = true
    }
    
}
