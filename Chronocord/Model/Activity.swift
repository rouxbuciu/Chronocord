//
//  Activity.swift
//  Chronocord
//
//  Created by roux g. buciu on 2018-01-20.
//  Copyright © 2018 roux g. buciu. All rights reserved.
//

import Foundation
import UIKit

enum ActivityCategory {
    case Chores
    case Downtime
    case Exercise
    case Family
    case Food
    case Healthcare
    case Hobby
    case Learning
    case Play
    case Productive
    case Romantic
    case Shopping
    case Sleep
    case Social
    case Travel
    case Wasted
    case Work
}

struct DefaultActivities {
    static let chores           = Activity(name: Constants.ActivityNames.chores,
                                           colour: StandardColours.chores,
                                           category: .Chores)
    static let downtime         = Activity(name: Constants.ActivityNames.downtime,
                                           colour: StandardColours.downtime,
                                           category: .Downtime)
    static let sleep            = Activity(name: Constants.ActivityNames.sleep,
                                           colour: StandardColours.sleep,
                                           category: .Sleep)
}

struct Activity {
    var name:                   String
    var colour:                 UIColor
    var category:               ActivityCategory
    
    init(name: String, colour: UIColor, category: ActivityCategory) {
        self.name               = name
        self.colour             = colour
        self.category           = category
    }
}
