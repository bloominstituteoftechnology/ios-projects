//
//  LoadingView.swift
//  LoadingUI
//
//  Created by Nikita Thomas on 1/9/19.
//  Copyright © 2019 Nikita Thomas. All rights reserved.
//

import UIKit

class SignView: UIView {
    
    let upCircleLayer = CAShapeLayer.init()
    var path = UIBezierPath.init()
    var animationDuration : Double = 2
    var frameHeight : CGFloat = 50.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    var signWavePath : UIBezierPath {
        var clockCycle = true
        let yPoint = self.frame.size.height/2
        frameHeight =  self.frame.size.width/6
        for x in 1...24{
            
            if x%2 != 0 {
                
                let xpath =  UIBezierPath(arcCenter: CGPoint(x: CGFloat(x)*frameHeight/2, y: yPoint),
                                          radius: frameHeight/2,
                                          startAngle: 180.0 * .pi/180.0,
                                          endAngle: 0.0,
                                          clockwise: clockCycle)
                path.append(xpath)
                
                if(clockCycle){
                    clockCycle = false
                }
                else{
                    clockCycle = true
                }
                
            }
        }
        
        return path;
    }
    
    func addAnimationLayer() {
        
        
        // Add Upper Circle Layer
        upCircleLayer.fillColor = UIColor.clear.cgColor
        upCircleLayer.strokeColor = UIColor.white.cgColor
        upCircleLayer.lineWidth = 8.0
        upCircleLayer.path = signWavePath.cgPath
        layer.addSublayer(upCircleLayer)
        
        animateStrokeUpCircle()
        
        Timer.scheduledTimer(timeInterval: animationDuration, target: self, selector: #selector(animateStrokeUpCircle), userInfo: nil, repeats: true)
    }
    
    
    @objc func animateStrokeUpCircle() {
        
        let strokeAnimation: CABasicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeAnimation.fromValue = 0.0
        strokeAnimation.toValue = 1.0
        strokeAnimation.duration = animationDuration
        strokeAnimation.isRemovedOnCompletion = false
        upCircleLayer.add(strokeAnimation, forKey: nil)
        
        expand1()
    }
    func expand1() {
        
        let expandAnimation: CABasicAnimation = CABasicAnimation(keyPath: "position")
        expandAnimation.fromValue = [0,sin(self.frame.width)]
        expandAnimation.toValue = [-self.frame.width,cos(self.frame.width)]
        expandAnimation.duration = animationDuration
        expandAnimation.fillMode = CAMediaTimingFillMode.forwards
        expandAnimation.isRemovedOnCompletion = false
        upCircleLayer.add(expandAnimation, forKey: nil)
    }
}

