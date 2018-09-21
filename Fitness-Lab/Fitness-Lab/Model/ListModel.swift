//
//  ListModel.swift
//  Fitness-Lab
//
//  Created by 張書涵 on 2018/9/20.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import Foundation

struct ListModel {
    private(set) public var videoImg: String
    private(set) public var durationLbl: String
    private(set) public var videoTitle: String
    private(set) public var videoDescription: String
    private(set) public var videoID: String
    private(set) public var intensity: String
    private(set) public var actionModel: [ActionModel]
    
    init(videoImg: String,
         durationLbl: String,
         videoTitle: String,
         videoDescription: String,
         intensity: String,
         videoID: String,
         actionModel: [ActionModel]) {
        self.videoImg = videoImg
        self.durationLbl = durationLbl
        self.videoTitle = videoTitle
        self.videoDescription = videoDescription
        self.intensity = intensity
        self.actionModel = actionModel
        self.videoID = videoID
    }
}


