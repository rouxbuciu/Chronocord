//
//  UserPreferences.swift
//  Chronocord
//
//  Created by roux g. buciu on 2018-01-20.
//  Copyright © 2018 roux g. buciu. All rights reserved.
//

import Foundation

enum WeightUnits {
    case Kilograms
    case Pounds
}

class UserSettings {
    var weightUnits: WeightUnits    = .Kilograms
}
