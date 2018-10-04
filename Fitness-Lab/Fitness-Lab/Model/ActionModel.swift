//
//  ActionModel.swift
//  Fitness-Lab
//
//  Created by 張書涵 on 2018/9/21.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import Foundation
struct ActionModel {
    private(set) public var youtubeTime: Double
    private(set) public var stopTime: Double?
    private(set) public var timesDescription: Double
    private(set) public var actionDescription: String
    private(set) public var restTime: Double?
    
    
    init(youtubeTime: Double,
         stopTime: Double,
         restTime: Double,
         timesDescription: Double,
         actionDescription: String) {
        
        self.youtubeTime = youtubeTime
        self.stopTime = stopTime
        self.timesDescription = timesDescription
        self.actionDescription = actionDescription
        self.restTime = restTime
    }
}
