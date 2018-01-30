//
//  AnimationDelegate.swift
//  Chronocord
//
//  Created by roux g. buciu on 2018-01-30.
//  Copyright © 2018 roux g. buciu. All rights reserved.
//

import QuartzCore

class AnimationDelegate: NSObject, CAAnimationDelegate {
    
    fileprivate let completion: () -> Void
    
    init(completion: @escaping () -> Void) {
        self.completion = completion
    }
    
    dynamic func animationDidStop(_: CAAnimation, finished: Bool) {
        completion()
    }
}
