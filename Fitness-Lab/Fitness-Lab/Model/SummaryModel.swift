//
//  SummaryModel.swift
//  Fitness-Lab
//
//  Created by 張書涵 on 2018/9/27.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import Foundation
import RealmSwift

class SummaryModel: Object {
    
    @objc dynamic var videoImg: String = ""
    @objc dynamic var durationLbl: String = ""
    @objc dynamic var videoTitle: String = ""
    @objc dynamic var scoreTitleLbl: String = ""
    @objc dynamic var workoutDate: TimeInterval = 0.0
    
    convenience init(videoImg: String,
                              durationLbl: String,
                              videoTitle: String ,
                              scoreTitleLbl: String,
                              workoutDate: TimeInterval) {
        self.init()
        self.videoImg = videoImg
        self.durationLbl = durationLbl
        self.videoTitle = videoTitle
        self.scoreTitleLbl = scoreTitleLbl
        self.workoutDate = workoutDate
    }
}


