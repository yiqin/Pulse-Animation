//
//  YQPulsingLayer.swift
//  PulsingHaloDemo
//
//  Created by yiqin on 7/12/14.
//  Copyright (c) 2014 Shuichi Tsutsumi. All rights reserved.
//

import UIKit
import QuartzCore

class YQPulsingLayer: CALayer {
    
    var radius: CGFloat
    var fromValueForRadius: CGFloat
    var fromValueForAlpha: CGFloat
    var keyTimeForHalfOpacity: CGFloat
    var animationDuration: NSTimeInterval
    var pulseInterval: NSTimeInterval
    var animationGroup: CAAnimationGroup
    
    init() {
        // before super.init()
        self.radius = 60
        self.fromValueForRadius = 0.0
        self.fromValueForAlpha = 0.45
        self.keyTimeForHalfOpacity = 0.2
        self.animationDuration = 1
        self.pulseInterval = 0
        self.animationGroup = CAAnimationGroup();
        
        super.init()
        
        // after super.init()
        self.repeatCount = Float.infinity;
        // self.backgroundColor = [[UIColor colorWithRed:0.000 green:0.478 blue:1.000 alpha:1] CGColor];
        self.backgroundColor =  UIColor(red: 0.0, green: 0.478, blue: 1.0, alpha: 1).CGColor;
        
        var tempPos = self.position;
        var diameter = self.radius * 2;
        self.bounds = CGRectMake(0, 0, diameter, diameter);
        self.cornerRadius = self.radius;
        self.position = tempPos;
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            
            self.setupAnimationGroup()
            
            if self.pulseInterval != Float.infinity {
                dispatch_async(dispatch_get_main_queue(), {
                    self.addAnimation(self.animationGroup, forKey: "pulse")
                    })
            }
        })
    }
    
    func setupAnimationGroup() {
        self.animationGroup = CAAnimationGroup()
        self.animationGroup.duration = self.animationDuration + self.pulseInterval
        self.animationGroup.repeatCount = self.repeatCount
        self.animationGroup.removedOnCompletion = false
        self.animationGroup.delegate = self
        
        var defaultCurve = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
        self.animationGroup.timingFunction = defaultCurve
        
        var scaleAnimation = CABasicAnimation(keyPath: "transform.scale.xy")
        scaleAnimation.fromValue = self.fromValueForRadius
        scaleAnimation.toValue = 1.0;
        scaleAnimation.duration = self.animationDuration;
        
        var opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        opacityAnimation.values = [self.fromValueForAlpha, 0.45, 0]
        opacityAnimation.keyTimes = [0, self.keyTimeForHalfOpacity, 1]
        opacityAnimation.duration = self.animationDuration
        opacityAnimation.removedOnCompletion = false
        
        var animations = [scaleAnimation, opacityAnimation]
        self.animationGroup.animations = animations
    }
    
    override func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
        self.removeFromSuperlayer()
    }
}













