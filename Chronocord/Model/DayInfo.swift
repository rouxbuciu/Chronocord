//
//  DayInfo.swift
//  Chronocord
//
//  Created by roux g. buciu on 2018-01-20.
//  Copyright © 2018 roux g. buciu. All rights reserved.
//

import Foundation

enum DayQuality {
    case Untracked
    case ReallyBad
    case Meh
    case Neutral
    case Okay
    case Fantastic
}

struct DayInfo {
    
    // MARK: - Private variables
    
    private let _date:              Date
    private var _timeData:          [TimeChunk]
    private var _weightData:        Double?
    private var _caloriesIn:        Int?
    private var _caloriesOut:       Int?
    private var _dayQuality:        DayQuality
    
    
    // MARK - Public variables
    
    var date: Date {
        get { return _date }
    }
    
    var timeData: [TimeChunk] {
        get { return _timeData }
    }
    
    /// Returns 0.0 if it's nil.
    var weightData: Double {
        get {
            guard let weight = _weightData else {
                return 0.0
            }
            
            if settings.weightUnits == .Kilograms {
                return weight
            } else {
                return weight * 2.2046
            }
        }
    }
    
    /// Returns 0 if it's nil.
    var caloriesIn: Int {
        get {
            guard let cals = _caloriesIn else {
                return 0
            }
            return cals
        }
    }
    
    /// Returns 0 if it's nil.
    var caloriesOut: Int {
        get {
            guard let cals = _caloriesOut else {
                return 0
            }
            return cals
        }
    }
    
    var dayQuality: DayQuality {
        get { return _dayQuality }
    }
    
    
    // MARK: - Initializer
    
    init(date: Date, timeData: [TimeChunk], weightData: Double?, caloriesIn: Int?, caloriesOut: Int?, dayQuality: DayQuality = .Untracked) {
        self._date          = date
        self._timeData      = timeData
        self._caloriesIn    = caloriesIn
        self._caloriesOut   = caloriesOut
        self._weightData    = weightData
        self._dayQuality    = dayQuality
    }
    
    // MARK: - Public methods
    
    public mutating func updateWeight(to newWeight: Double) {
        var convertedWeight = newWeight
        if settings.weightUnits == .Pounds {
            convertedWeight = newWeight/2.2046
        }
        self._weightData = convertedWeight
    }
    
    public mutating func updateCaloriesIn(to newCI: Int) {
        self._caloriesIn = newCI
    }
    
    public mutating func updateCaloriesOut(to newCO: Int) {
        self._caloriesOut = newCO
    }
    
    public mutating func updateDayQuality(to dayQuality: DayQuality) {
        self._dayQuality = dayQuality
    }
}
