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
    case Untracked
    case Wasted
    case Work
}


/// Each activity should be a discreet object such that once created, is just passed
/// on, without ever changing.
class Activity {
    
    // MARK: - Variables
    
    let name:                   String
    let colour:                 UIColor
    let category:               ActivityCategory
    
    
    // MARK: - Initializer
    
    init(name: String, colour: UIColor, category: ActivityCategory) {
        self.name               = name
        self.colour             = colour
        self.category           = category
    }
}


// MARK: - Default activities

class DefaultActivities {
    static let chores           = Activity(name: TextConstants.ActivityNames.chores,
                                           colour: DesignConstants.Colours.Activity.chores,
                                           category: .Chores)
    static let downtime         = Activity(name: TextConstants.ActivityNames.downtime,
                                           colour: DesignConstants.Colours.Activity.downtime,
                                           category: .Downtime)
    static let exercise         = Activity(name: TextConstants.ActivityNames.exercise,
                                           colour: DesignConstants.Colours.Activity.exercise,
                                           category: .Exercise)
    static let sleep            = Activity(name: TextConstants.ActivityNames.sleep,
                                           colour: DesignConstants.Colours.Activity.sleep,
                                           category: .Sleep)
    static let untracked        = Activity(name: TextConstants.ActivityNames.untracked,
                                           colour: DesignConstants.Colours.UI.primaryGrey,
                                           category: .Untracked)
}
