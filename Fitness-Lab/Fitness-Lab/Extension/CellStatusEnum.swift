//
//  CellStatusEnum.swift
//  Fitness-Lab
//
//  Created by 張書涵 on 2018/10/5.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import Foundation

enum CellStatus: String, Codable {
    
    case played
    case playing
    case willplay
    
}

enum ActionOrRest: String, Codable {
    
    case action
    case rest
}

enum PlayingOrPause: String, Codable {
    
    case playing
    case pause
    
}

enum TimeRange: String, Codable {
    
    case max3
    case threeToNine
    case min9
    
}

enum CueTone: String, Codable {
    
    case open
    case close
    
}
