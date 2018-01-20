//
//  Activity.swift
//  Chronocord
//
//  Created by roux g. buciu on 2018-01-20.
//  Copyright © 2018 roux g. buciu. All rights reserved.
//

import Foundation
import UIKit

struct DefaultActivities {
    
    static let sleep            = Activity(name: Constants.ActivityNames.sleep,
                                           colour: StandardColours.grey)
}

struct Activity {
    var name:                   String
    var colour:                 UIColor
    
    init(name: String, colour: UIColor) {
        self.name               = name
        self.colour             = colour
    }
}
