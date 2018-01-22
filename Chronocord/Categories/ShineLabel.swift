//
//  ShineLabel.swift
//  Chronocord
//
//  Created by roux g. buciu on 2018-01-21.
//  Copyright © 2018 roux g. buciu. All rights reserved.
//

import Foundation
import UIKit

class ShineLabel: UILabel {
    
    /*
     // Only override drawRect: if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func drawRect(rect: CGRect) {
     // Drawing code
     }
     */
    
    var shineDuration : CFTimeInterval = 0
    var fadeoutDuration : CFTimeInterval = 0
    var autoStart: Bool = false
    
    var shining : Bool {
        get {
            return !(self.displaylink!.isPaused)
        }
    }
    
    var visible : Bool {
        get {
            return (self.fadeOut == false)
        }
    }
    
    private var attributedString: NSMutableAttributedString?
    private var characterAnimationDurtions = [CFTimeInterval]()
    private var characterAnimationDelays = [CFTimeInterval]()
    private var displaylink: CADisplayLink?
    private var beginTime: CFTimeInterval = 0
    private var endTime: CFTimeInterval = 0
    private var fadeOut: Bool
    private var completion: (() -> Void)?
    
    override internal var text: String? {
        set {
            super.text = newValue
            attributedText = NSMutableAttributedString(string: newValue!)
            
        }
        get {
            return super.text
        }
    }
    
    override internal var attributedText: NSAttributedString? {
        set {
            attributedString = self.initialAttributedString(attributedString: newValue)
            super.attributedText = newValue
            
            for index in 0...newValue!.length - 1 {
                let delay = Double(arc4random_uniform(UInt32(shineDuration / 2 * 100))) / 100.0
                characterAnimationDelays.insert(delay, at: index)
                let remain = shineDuration - delay
                //                characterAnimationDurtions[index] = Double(arc4random_uniform(UInt32(remain * 100))) / 100.0
                characterAnimationDurtions.insert(Double(arc4random_uniform(UInt32(remain * 100))) / 100.0, at: index)
            }
        }
        get {
            return super.attributedText
        }
    }
    convenience init() {
        self.init(frame:CGRect.zero)
    }
    
    override init(frame: CGRect) {
        shineDuration = 2.5
        fadeoutDuration = 2.5
        autoStart = false
        fadeOut = true
        
        super.init(frame: frame)
        self.textColor = UIColor.white
        displaylink = CADisplayLink(target: self, selector:#selector(ShineLabel.updateAttributedString))
        displaylink!.isPaused = true
        displaylink!.add(to: RunLoop.current, forMode: RunLoopMode.commonModes)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToWindow() {
        if (self.window != nil) && self.autoStart {
            self.appear()
        }
    }
    
    @objc internal func updateAttributedString() {
        let now = CACurrentMediaTime()
        for index in 0...attributedString!.length - 1 {
            //            let indexString = attributedString!.string.characters(index)
            //            NSCharacterSet.whitespaceCharacterSet().characterIsMember(indexString) {
            //                continue
            //            }
            
            attributedString!.enumerateAttribute(NSAttributedStringKey.foregroundColor, in: NSMakeRange(index, 1), options: NSAttributedString.EnumerationOptions(rawValue: 0), using: { (value, range, stop) in
                
                let currentAlpha = (value as AnyObject).cgColor.alpha
                let checkAlpha = (self.fadeOut && (currentAlpha > 0)) || (!self.fadeOut && (currentAlpha < 1))
                let shouldUpdateAlpha : Bool = checkAlpha || (now - self.beginTime) >= self.characterAnimationDelays[index]
                if !shouldUpdateAlpha {
                    return
                }
                
                var percentage = (now - self.beginTime - self.characterAnimationDelays[index]) / (self.characterAnimationDurtions[index])
                if (self.fadeOut) {
                    percentage = 1 - percentage
                }
                
                let color = self.textColor.withAlphaComponent(CGFloat(percentage))
                self.attributedString!.addAttributes([NSAttributedStringKey.foregroundColor : color], range: range)
            })
        }
        
        super.attributedText = attributedString
        if now > endTime {
            displaylink!.isPaused = true
            if self.completion != nil {
                self.completion!()
            }
        }
    }
    
    
    internal func initialAttributedString(attributedString: NSAttributedString?) -> NSMutableAttributedString? {
        if attributedString == nil {
            return nil
        }
        
        let mutableAttributedString = attributedString!.mutableCopy() as! NSMutableAttributedString
        let color = textColor.withAlphaComponent(0)
        mutableAttributedString.addAttributes([NSAttributedStringKey.foregroundColor : color], range: NSMakeRange(0, mutableAttributedString.length))
        
        return mutableAttributedString
    }
    
    
    // MARK: - Public methods
    
    public func appear() {
        appearWithCompletion(completion: nil)
    }
    
    public func appearWithCompletion(completion: (() -> Void)?) {
        if (!self.shining) && (self.fadeOut) {
            self.completion = completion
            fadeOut = false
            startAppearing(duration: fadeoutDuration)
        }
    }
    
    public func disappear() {
        disappearWithCompletion(completion: nil)
    }
    
    public func disappearWithCompletion(completion: (() -> Void)?) {
        if (!self.shining) && (!self.fadeOut) {
            self.completion = completion
            fadeOut = true
            startAppearing(duration: fadeoutDuration)
        }
    }
    
    public func startAppearing(duration: CFTimeInterval) {
        beginTime = CACurrentMediaTime()
        endTime = beginTime + shineDuration
        displaylink!.isPaused = false
    }
}
