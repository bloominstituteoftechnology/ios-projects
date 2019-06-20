//
//  ViewController.swift
//  DemoLoadinator
//
//  Created by Michael Redig on 6/19/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

import UIKit
import LoadinationIndicator

class ViewController: UIViewController {
	var animatedLoadingView: LoadinationAnimatorView?

	@IBAction func stopPressed(_ sender: UIBarButtonItem) {
		UIView.animate(withDuration: 0.2, animations: { [weak self] in
			self?.animatedLoadingView?.alpha = 0
		}) { [weak self] _ in
			self?.animatedLoadingView?.removeFromSuperview()
		}
	}

	@IBAction func bouncePressed(_ sender: UIButton) {
		animatedLoadingView = LoadinationAnimatorView(frame: view.frame)
		animatedLoadingView?.statusLabelPosition = .top
		animatedLoadingView?.statusLabel.text = "BOUNCE!"
		animatedLoadingView?.animation = .bounce
		view.addSubview(animatedLoadingView!)
		animatedLoadingView?.beginAnimation()
	}

	@IBAction func growFadePressed(_ sender: UIButton) {
		animatedLoadingView = LoadinationAnimatorView(frame: view.frame)
		animatedLoadingView?.statusLabelPosition = .bottom
		animatedLoadingView?.statusLabel.text = "Grow and fade..."
		view.addSubview(animatedLoadingView!)
		animatedLoadingView?.beginAnimation()
	}

	@IBAction func panelPressed(_ sender: UIButton) {
		animatedLoadingView = LoadinationAnimatorView.fullScreenPanel()
		animatedLoadingView?.statusLabelPosition = .bottom
		animatedLoadingView?.statusLabel.text = "Panel mode... ACTIVATE!"
		animatedLoadingView?.animation = .bounce
		animatedLoadingView?.beginAnimation()

		var seconds = 4
		_ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] (timer) in
			self?.animatedLoadingView?.statusLabel.text = "Deactivating in \(seconds)"
			seconds -= 1
			if seconds == 0 {
				timer.invalidate()
			}
		}

		DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
			UIView.animate(withDuration: 0.2, animations: { [weak self] in
				self?.animatedLoadingView?.alpha = 0
			}) { [weak self] _ in
				self?.animatedLoadingView?.removeFromSuperview()
			}
		}
	}

	@IBAction func fullscreenPressed(_ sender: UIButton) {
		animatedLoadingView = LoadinationAnimatorView.fullscreenOverlay()
		animatedLoadingView?.statusLabelPosition = .bottom
		animatedLoadingView?.statusLabel.text = ""
		let hue: CGFloat = 0.6
		animatedLoadingView?.backgroundColor = UIColor(hue: hue, saturation: 0.3, brightness: 0.3, alpha: 0.7)
		animatedLoadingView?.tintColor = UIColor(hue: hue, saturation: 0.8, brightness: 0.8, alpha: 1)
		animatedLoadingView?.beginAnimation()

		var seconds = 4
		_ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] (timer) in
			self?.animatedLoadingView?.statusLabel.text = "Deactivating in \(seconds)"
			seconds -= 1
			if seconds == 0 {
				timer.invalidate()
			}
		}

		DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
			UIView.animate(withDuration: 0.2, animations: { [weak self] in
				self?.animatedLoadingView?.alpha = 0
			}) { [weak self] _ in
				self?.animatedLoadingView?.removeFromSuperview()
			}
		}
	}

}

