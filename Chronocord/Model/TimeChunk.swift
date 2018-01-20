//
//  TimeChunk.swift
//  Chronocord
//
//  Created by roux g. buciu on 2018-01-20.
//  Copyright © 2018 roux g. buciu. All rights reserved.
//

import Foundation

struct TimeChunk {
    var daySegment:         Int
    var activity:           Activity
    
    var time: String {
        get {
            switch daySegment {
            case 1:         return "12:00 am"
            case 2:         return "12:30 am"
            case 3:         return "1:00 am"
            case 4:         return "1:30 am"
            case 5:         return "2:00 am"
            case 6:         return "2:30 am"
            case 7:         return "3:00 am"
            case 8:         return "3:30 am"
            case 9:         return "4:00 am"
            case 10:        return "4:30 am"
            case 11:        return "5:00 am"
            case 12:        return "5:30 am"
            case 13:        return "6:00 am"
            case 14:        return "6:30 am"
            case 15:        return "7:00 am"
            case 16:        return "7:30 am"
            case 17:        return "8:00 am"
            case 18:        return "8:30 am"
            case 19:        return "9:00 am"
            case 20:        return "9:30 am"
            case 21:        return "10:00 am"
            case 22:        return "10:30 am"
            case 23:        return "11:00 am"
            case 24:        return "11:30 am"
            case 25:        return "12:00 pm"
            case 26:        return "12:30 pm"
            case 27:        return "1:00 pm"
            case 28:        return "1:30 pm"
            case 29:        return "2:00 pm"
            case 30:        return "2:30 pm"
            case 31:        return "3:00 pm"
            case 32:        return "3:30 pm"
            case 33:        return "4:00 pm"
            case 34:        return "4:30 pm"
            case 35:        return "5:00 pm"
            case 36:        return "5:30 pm"
            case 37:        return "6:00 pm"
            case 38:        return "6:30 pm"
            case 39:        return "7:00 pm"
            case 40:        return "7:30 pm"
            case 41:        return "8:00 pm"
            case 42:        return "8:30 pm"
            case 43:        return "9:00 pm"
            case 44:        return "9:30 pm"
            case 45:        return "10:00 pm"
            case 46:        return "10:30 pm"
            case 47:        return "11:00 pm"
            case 48:        return "11:30 pm"
            default:        break
            }
        }
    }
    
    init(daySegment: Int, activity: Activity) {
        self.daySegment     = daySegment
        self.activity       = activity
    }
}
