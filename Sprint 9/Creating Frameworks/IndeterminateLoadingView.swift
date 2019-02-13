//
//  LoadingView.swift
//  LoadingUI
//
//  Created by Andrew R Madsen on 9/18/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class IndeterminateLoadingView: UIView, CAAnimationDelegate {
    
    init(frame: CGRect, strokeColor: UIColor = .black, thickness: CGFloat = 10.0) {
        self.strokeColor = strokeColor
        self.thickness = thickness
        super.init(frame: frame)
        setupShapeLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupShapeLayer()
    }
    
    func startAnimating() {
        guard !isAnimating else { return }
        defer { isAnimating = true }
    
        startAnimation()
    }
    
    func stopAnimating() {
        guard isAnimating else { return }
        
        shouldStopAnimationOnNextCycle = true
    }
    
    // MARK: - Private
    
    private func setupShapeLayer() {
        
        shapeLayer.frame = layer.bounds
        shapeLayer.strokeColor = strokeColor.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = thickness
        shapeLayer.strokeStart = 0.0
        shapeLayer.strokeEnd = 0.0
        layer.addSublayer(shapeLayer)
        
        let radius = min(bounds.width, bounds.height) / 2.0 - thickness/2.0
        let rect = CGRect(x: bounds.midX - radius/2.0, y: bounds.midY - radius/2.0, width: radius, height: radius)
        let path = UIBezierPath(ovalIn: rect)
        
        shapeLayer.path = path.cgPath
    }
    
    private func startAnimation() {
        shouldStopAnimationOnNextCycle = false
        shapeLayer.strokeStart = 0.0
        shapeLayer.strokeEnd = 1.0
        let animations = setupAnimations()
        startAnimations(animations, with: "loading")
    }
    
    private func startAnimations(_ animations: [CABasicAnimation], with keyPath: String) {
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = animations
        animationGroup.duration = duration
        animationGroup.delegate = self
        shapeLayer.add(animationGroup, forKey: keyPath)
    }
    
    
    private func setupAnimations() -> [CABasicAnimation] {
        let addStrokeAnimation = CABasicAnimation(keyPath: "strokeEnd")
        addStrokeAnimation.fromValue = 0.0
        addStrokeAnimation.toValue = 1.0
        addStrokeAnimation.beginTime = 0
        addStrokeAnimation.duration = duration/2
        addStrokeAnimation.isRemovedOnCompletion = true
        addStrokeAnimation.timingFunction = CAMediaTimingFunction(name: .easeIn)
        
        let rotateWheelAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateWheelAnimation.fromValue = 0.0
        rotateWheelAnimation.toValue = CGFloat.pi * 2
        rotateWheelAnimation.duration = duration
        rotateWheelAnimation.timingFunction = CAMediaTimingFunction(name: .linear)
        
        let strokeColorInAnimation = CABasicAnimation(keyPath: "strokeColor")
        strokeColorInAnimation.fromValue = UIColor.white.cgColor
        strokeColorInAnimation.toValue = strokeColor.cgColor
        strokeColorInAnimation.duration = duration/2
        strokeColorInAnimation.timingFunction = CAMediaTimingFunction(name: .easeIn)
        
        let strokeColorOutAnimation = CABasicAnimation(keyPath: "strokeColor")
        strokeColorOutAnimation.fromValue = strokeColor.cgColor
        strokeColorOutAnimation.toValue = UIColor.white.cgColor
        strokeColorOutAnimation.beginTime = duration/2
        strokeColorOutAnimation.duration = duration/2
        strokeColorOutAnimation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        
        let removeStrokeAnimation = CABasicAnimation(keyPath: "strokeStart")
        removeStrokeAnimation.fromValue = 0.0
        removeStrokeAnimation.toValue = 1.0
        removeStrokeAnimation.beginTime = duration/2
        removeStrokeAnimation.duration = duration/2
        removeStrokeAnimation.isRemovedOnCompletion = true
        removeStrokeAnimation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        
        return [addStrokeAnimation, rotateWheelAnimation, removeStrokeAnimation]
    }
    
    // MARK: - CAAnimationDelegate
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        guard !shouldStopAnimationOnNextCycle else {
            shouldStopAnimationOnNextCycle = false
            isAnimating = false
            shapeLayer.removeAllAnimations()
            return
        }
        shapeLayer.removeAllAnimations()
        let animations = setupAnimations()
        startAnimations(animations, with: "loading")
    }
    
    // MARK: - Properties
    
    private var strokeColor: UIColor = .black
    private var thickness: CGFloat = 10.0
    
    private(set) var isAnimating = false

    private let shapeLayer = CAShapeLayer()
    private let duration = 2.0
    private var shouldStopAnimationOnNextCycle = false
}
