//
//  LoadinationAnimatorView.swift
//  LoadinationIndicator
//
//  Created by Michael Redig on 6/19/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

import UIKit

/// Class that displays an indeterminate progress indicator with animation.
public class LoadinationAnimatorView: UIView {

	// MARK: - Properties: IB
	@IBOutlet var contentView: UIView!
	@IBOutlet var animatedViews: [UIView]!


	/// Access to the status label. Customize however you'd like. Set to empty to eliminate.
	@IBOutlet public var statusLabel: UILabel!
	@IBOutlet var statusBottomAnchor: NSLayoutConstraint!
	@IBOutlet var statusTopAnchor: NSLayoutConstraint!

	// MARK: - Properties: Status
	private var animationStopping: Bool = false

	/// Boolean indicating if animation is currently running.
	public var isAnimating: Bool {
		for blob in animatedViews {
			if blob.layer.animationKeys() != nil {
				return true
			}
		}
		return false
	}

	// MARK: - Options
	/// States the status label can be in.
	public enum StatusLabelPosition {
		/// Positioned on top of the animation
		case top
		/// Positioned below the animation
		case bottom
	}
	/// Set to change the location of the status label.
	public var statusLabelPosition = StatusLabelPosition.bottom {
		didSet {
			switch statusLabelPosition {
			case .top:
				statusBottomAnchor.isActive = false
				statusTopAnchor.isActive = true
			case .bottom:
				statusTopAnchor.isActive = false
				statusBottomAnchor.isActive = true
			}
		}
	}

	/// Access to the background color property.
	public override var backgroundColor: UIColor? {
		get {
			return contentView.backgroundColor
		}
		set {
			contentView.backgroundColor = newValue
		}
	}

	/// Access to the tint color property.
	public override var tintColor: UIColor? {
		get {
			return animatedViews.first?.backgroundColor
		}
		set {
			for blob in animatedViews {
				blob.backgroundColor = newValue
			}
		}
	}

	/// Determines the animation that is run when `beginAnimation` is called. Must be set first.
	public var animation = Animation.growFade
	/// Enumeration of the different Animation types
	public enum Animation {
		/// A slow, mezmerizing grow and fade animation
		case growFade
		/// A cheeky bounce, before the blobs disappear
		case bounce
	}

	// MARK: - Inits
	public override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}

	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		commonInit()
	}

	private func commonInit() {
		let bundle = Bundle.init(for: type(of: self))
		let nib = UINib(nibName: "AnimationView", bundle: bundle)
		nib.instantiate(withOwner: self, options: nil)
		contentView.frame = bounds
		addSubview(contentView)

		for blob in animatedViews {
			blob.layer.cornerRadius = blob.frame.height / 2
			blob.backgroundColor = .white
		}
	}

	// MARK: - Controls
	/// Animation will not start on its own, but needs `beginAnimation` to be called.
	public func beginAnimation() {
		animationStopping = false
		for (index, blob) in animatedViews.enumerated() {
			switch animation {
			case .bounce:
				animateBounce(view: blob, delayed: Double(index))
			case .growFade:
				animateGrowFade(view: blob, delayed: Double(index) * 1)
			}
		}
	}


	/// Allows you control to end the animation without removing the view from the screen. By default, it will allow
	/// existing animations to play out.
	///
	/// - Parameter immediate: Force animations to cease immediately. Can be jarring.
	public func endAnimation(immediately immediate: Bool = false) {
		animationStopping = true
		if immediate {
			for blob in animatedViews {
				blob.layer.removeAllAnimations()
				blob.transform = CGAffineTransform(scaleX: 0, y: 0)
				blob.alpha = 0
			}
		}
	}

}

// MARK: - Actual Animations
extension LoadinationAnimatorView {
	private func animateGrowFade(view: UIView, duration: TimeInterval = 3, delayed: TimeInterval = 0) {
		view.transform = CGAffineTransform(scaleX: 0, y: 0)
		view.alpha = 0
		guard animationStopping == false else { return }
		UIView.animateKeyframes(withDuration: duration, delay: delayed, options: [.calculationModePaced], animations: {
			UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 1, animations: {
				view.transform = CGAffineTransform(scaleX: 3, y: 3)
			})
			UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.4, animations: {
				view.alpha = 1
			})
			UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.2, animations: {
				view.alpha = 0
			})
		}) { [weak self] _ in
			self?.animateGrowFade(view: view, duration: duration)
		}
	}

	private func animateBounce(view: UIView, duration: TimeInterval = 3, delayed: TimeInterval = 0) {
		view.transform = CGAffineTransform(scaleX: 1, y: 1)
		let bounceStart = CGAffineTransform(translationX: 0, y: 120)
		view.transform = bounceStart
		view.alpha = 0

		guard animationStopping == false else { return }

		let fades = {
			UIView.animateKeyframes(withDuration: duration, delay: 0, options: [], animations: {
				UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.01, animations: {
					view.alpha = 1.0
				})
				UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.2, animations: {
					view.alpha = 0
				})
			})
		}

		let dampening: CGFloat = 0.3
		let bounce = {
			UIView.animate(withDuration: duration / 3, delay: 0, usingSpringWithDamping: dampening, initialSpringVelocity: 0, options: [], animations: {
				view.transform = .identity
			})
			UIView.animate(withDuration: duration / 6, delay: (duration / 6) * 5, options: [], animations: {
				view.transform = bounceStart
			}, completion: { [weak self] _ in
				self?.animateBounce(view: view, duration: duration, delayed: 0.2)
			})
		}

		DispatchQueue.main.asyncAfter(deadline: .now() + delayed) {
			fades()
			bounce()
		}

	}
}

// MARK: - Special
extension LoadinationAnimatorView {
	/// Convenience function to get the entire screen covered in the progress indicator. Note that this prevents all
	/// input from occurring. There is also no need to add as a subview, as that is handled internally. Just remember to
	/// call `beginAnimation`
	///
	/// - Returns: Reference to LoadinationAnimatorView that will cover the whole screen
	public static func fullscreenOverlay() -> LoadinationAnimatorView? {
		guard let rootView = UIApplication.shared.delegate?.window??.rootViewController?.view else { return nil }
		let animationView = LoadinationAnimatorView(frame: rootView.frame)
		rootView.addSubview(animationView)
		return animationView
	}

	/// Convenience function to a panel based indicator. Note that this prevents all
	/// input from occurring. There is also no need to add as a subview, as that is handled internally. Just remember to
	/// call `beginAnimation`
	///
	/// - Parameter size: CGSize value to customize the size of the panel. Defaults to 350.
	/// - Returns: Reference to LoadinationAnimatorView panel view
	public static func fullScreenPanel(sized size: CGFloat = 350) -> LoadinationAnimatorView? {
		guard let animator = fullscreenOverlay() else { return nil }
		animator.contentView.translatesAutoresizingMaskIntoConstraints = false

		animator.contentView.heightAnchor.constraint(equalToConstant: size).isActive = true
		animator.contentView.widthAnchor.constraint(equalToConstant: size).isActive = true
		animator.contentView.centerXAnchor.constraint(equalTo: animator.centerXAnchor).isActive = true
		animator.contentView.centerYAnchor.constraint(equalTo: animator.centerYAnchor).isActive = true

		animator.contentView.layer.cornerRadius = 50

		return animator
	}
}
