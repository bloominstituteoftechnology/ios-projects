//
//  ViewController.swift
//  LoadingUITest
//
//  Created by Sergey Osipyan on 2/13/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

import UIKit
import LoadingUI

class ViewController: UIViewController {

    
   @IBOutlet weak var button: UIButton!
    let indeterminateLoadingView = IndeterminateLoadingView()
    let loadingViewController = LoadingViewController()
    
    let shapeLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // let's start by drawing a circle somehow
        
        let center = view.center
        
        // create my track layer
        let trackLayer = CAShapeLayer()
        
        let circularPath = UIBezierPath(arcCenter: center, radius: 25, startAngle: -2 * CGFloat.pi, endAngle: 2 * CGFloat.pi, clockwise: true)
        trackLayer.path = circularPath.cgPath
        
//        trackLayer.strokeColor = UIColor.clear.cgColor
//        trackLayer.lineWidth = 5
//        trackLayer.fillColor = UIColor.clear.cgColor
//        trackLayer.lineCap = CAShapeLayerLineCap.round
//        view.layer.addSublayer(trackLayer)
        
        //        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.strokeColor = UIColor.gray.cgColor
        shapeLayer.lineWidth = 12
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        
        shapeLayer.strokeEnd = 0
        
        view.layer.addSublayer(shapeLayer)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    @objc private func handleTap() {
        print("Attempting to animate stroke")
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        basicAnimation.toValue = 1
        
        basicAnimation.duration = 2
        
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
    }


}




