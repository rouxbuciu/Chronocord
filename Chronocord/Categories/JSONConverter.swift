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
//        "dayData": {
//            "2018-20-01" : {
//                "weight": 213,
//                "calories in": 2139,
//                "calories out": 2309,
//                "day quality": 4,
//                "timeChunkID": "1239876192goeuha882m23823bx2"
//            },
//        },
//        "timeChunks": {
//            "chunkID": {
//                "1239876192goeuha882m23823bx2": {
//                    "timechunk info": info
//                }
//            }
//        }
//    }
//}

