//
//  StandardColors.swift
//  Chronocord
//
//  Created by roux g. buciu on 2018-01-20.
//  Copyright © 2018 roux g. buciu. All rights reserved.
//

import Foundation
import UIKit

/// The standard colours that the app will use for everything.
struct StandardColours {
    
    // Main UI colours.
    struct UI {
        static let primaryGrey          = UIColor(hex: 0x424242)
        static let lightGrey            = UIColor(hex: 0x6d6d6d)
        static let darkGrey             = UIColor(hex: 0x1b1b1b)
        
        static let primaryTeal          = UIColor(hex: 0x80cbc4)
        static let lightTeal            = UIColor(hex: 0xb2fef7)
        static let darkTeal             = UIColor(hex: 0x4f9a94)
        
        static let accentLightBeige     = UIColor(hex: 0xDEE0D6)
        static let accentBeige          = UIColor(hex: 0xBCA590)
        static let accentOrange         = UIColor(hex: 0xD16F54)
    }
    
    
    // Activity colours.
    struct Activity {
        static let chores               = UIColor(hex: 0x4f9a94)
        static let downtime             = UIColor(hex: 0x4f9a94)
        static let exercise             = UIColor(hex: 0x4f9a94)
        static let family               = UIColor(hex: 0x4f9a94)
        static let food                 = UIColor(hex: 0x4f9a94)
        static let healthcare           = UIColor(hex: 0x4f9a94)
        static let hobby                = UIColor(hex: 0x4f9a94)
        static let learning             = UIColor(hex: 0x4f9a94)
        static let play                 = UIColor(hex: 0x4f9a94)
        static let productive           = UIColor(hex: 0x4f9a94)
        static let romantic             = UIColor(hex: 0x4f9a94)
        static let shopping             = UIColor(hex: 0x4f9a94)
        static let sleep                = UIColor(hex: 0x4f9a94)
        static let social               = UIColor(hex: 0x4f9a94)
        static let travel               = UIColor(hex: 0x4f9a94)
        static let wasted               = UIColor(hex: 0x4f9a94)
        static let work                 = UIColor(hex: 0x4f9a94)
    }
}



// MARK: - UIColour extension
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0,
                  green: CGFloat(green) / 255.0,
                  blue: CGFloat(blue) / 255.0,
                  alpha: 1.0)
    }
    
    /// Allows entering of hex numbers as colours.
    ///
    /// - Parameter hex: A hex colour value.
    convenience init(hex: Int) {
        self.init(
            red: (hex >> 16) & 0xFF,
            green: (hex >> 8) & 0xFF,
            blue: hex & 0xFF
        )
    }
}
