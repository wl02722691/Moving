//
//  ListCellModel.swift
//  Moving
//
//  Created by 張書涵 on 2018/11/5.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import Foundation

struct ListCellModel {
    
    let videoImg: String
    let durationLbl: Int
    let videoTitle: String
    let videoDescription: String
    let videoID: String
    let intensity: String
    let timeRange: TimeRange
    //let actionModel: [ActionModel]
    let actionModel: [NewActionModel]
    
    init(listModel: NewListModel) {
        
        self.videoImg = listModel.videoImg
        self.durationLbl = listModel.durationLbl
        self.videoTitle = listModel.videoTitle
        self.videoDescription = listModel.videoDescription
        self.intensity = listModel.intensity
        //self.actionModel = listModel.actionModel
        self.actionModel = listModel.actionModel
        self.videoID = listModel.videoID
        self.timeRange = listModel.timeRange
        
    }
    
}
