//
//  HelpVC.swift
//  Chronocord
//
//  Created by roux g. buciu on 2018-01-30.
//  Copyright © 2018 roux g. buciu. All rights reserved.
//

import Foundation
import UIKit

class HelpVC: UIView {
    
    @IBOutlet var viewContainer: UIView!
    
    func xibSetup() {
        Bundle.main.loadNibNamed("HelpVC", owner: self, options: nil)
        viewContainer.frame = self.bounds
        viewContainer.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        self.addSubview(viewContainer)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        xibSetup()
    }
    
}
