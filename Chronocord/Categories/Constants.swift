//
//  Constants.swift
//  Chronocord
//
//  Created by roux g. buciu on 2018-01-19.
//  Copyright © 2018 roux g. buciu. All rights reserved.
//

import Foundation

struct Constants {
    
    /// Constants concerning analytics events.
    struct AnalyticEvents {
        struct Login {
            static let loginButton          = "Login button tapped"
            static let loginViewPresented   = "Login view presented"
        }
    }
    

    struct ActivityNames {
        static let chores                   = NSLocalizedString("Chores", comment: "")
        static let downtime                 = NSLocalizedString("Downtime", comment: "")
        static let exercise                 = NSLocalizedString("Exercise", comment: "")
        static let family                   = NSLocalizedString("Family", comment: "")
        static let food                     = NSLocalizedString("Food", comment: "")
        static let healthcare               = NSLocalizedString("Healthcare", comment: "")
        static let hobby                    = NSLocalizedString("Hobby", comment: "")
        static let learning                 = NSLocalizedString("Learning", comment: "")
        static let play                     = NSLocalizedString("Play", comment: "")
        static let productive               = NSLocalizedString("Productive", comment: "")
        static let romantic                 = NSLocalizedString("Romantic", comment: "")
        static let shopping                 = NSLocalizedString("Shopping", comment: "")
        static let sleep                    = NSLocalizedString("Sleep", comment: "")
        static let social                   = NSLocalizedString("Social", comment: "")
        static let travel                   = NSLocalizedString("Travel", comment: "")
        static let untracked                = NSLocalizedString("", comment: "")
        static let wasted                   = NSLocalizedString("Wasted", comment: "")
        static let work                     = NSLocalizedString("Work", comment: "")
    }
}
