//
//  UITableViewCellExtension.swift
//  Chronocord
//
//  Created by roux g. buciu on 2018-01-30.
//  Copyright © 2018 roux g. buciu. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    @IBInspectable var normalBackgroundColor: UIColor? {
        get {
            return backgroundView?.backgroundColor
        }
        set(color) {
            let background = UIView()
            background.backgroundColor = color
            backgroundView = background
        }
    }
    
    @IBInspectable var selectedBackgroundColor: UIColor? {
        get {
            return selectedBackgroundView?.backgroundColor
        }
        set(color) {
            let background = UIView()
            background.backgroundColor = color
            selectedBackgroundView = background
        }
    }
}
