//
//  ActionModel.swift
//  Fitness-Lab
//
//  Created by 張書涵 on 2018/9/21.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import Foundation
struct ActionModel {
    private(set) public var youtubeTime: String
    private(set) public var timesDescription: String
    private(set) public var actionDescription: String
    private(set) public var restTime: String?
    
    init(youtubeTime: String,
         timesDescription: String,
         actionDescription: String,
         restTime: String) {
        self.youtubeTime = youtubeTime
        self.timesDescription = timesDescription
        self.actionDescription = actionDescription
        self.restTime = restTime
    }
}


