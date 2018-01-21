//
//  UnderlinedLabel.swift
//  Chronocord
//
//  Created by roux g. buciu on 2018-01-21.
//  Copyright © 2018 roux g. buciu. All rights reserved.
//

import Foundation
import UIKit

class UnderlinedLabel: UILabel {
    
    override var text: String? {
        didSet {
            guard let text = text else { return }
            let textRange = NSMakeRange(0, text.count)
            let attributedText = NSMutableAttributedString(string: text)
            attributedText.addAttribute(NSAttributedStringKey.underlineStyle,
                                        value: NSUnderlineStyle.styleSingle.rawValue,
                                        range: textRange)
            // Add other attributes if needed
            self.attributedText = attributedText
        }
    }
}
