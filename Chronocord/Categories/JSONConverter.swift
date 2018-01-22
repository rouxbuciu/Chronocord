//
//  JSONConverter.swift
//  Chronocord
//
//  Created by roux g. buciu on 2018-01-20.
//  Copyright © 2018 roux g. buciu. All rights reserved.
//

import Foundation

// The JSON tree built/received should look like the following
//
//{
//    "userID": {
//        "dayInfo": {
//            "2018-20-01" : {
//                "dayID": 2018003
//                "weight": 213,
//                "calories in": 2139,
//                "calories out": 2309,
//                "day quality": 4,
//            }, {.....}
//        },
//        "dayID": {
//            "2018003": {
//                "201800301": {
//                    "daysegment": 01,
//                    "activity": "Hobby"
//                }
//            }
//    },
//    "anotherUserID": {...}
//}
