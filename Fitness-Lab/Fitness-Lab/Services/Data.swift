//
//  Data.swift
//  Fitness-Lab
//
//  Created by 張書涵 on 2018/9/20.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import Foundation
class Data {
    
    static let instance = Data()
    
    private let fitCategories = [
        FitnessCategory(title: "全身運動", imageName: "1", secondTitle: "Core workout"),
        FitnessCategory(title: "腹部運動", imageName: "2", secondTitle: "Abs workout"),
        FitnessCategory(title: "臀部運動", imageName: "3", secondTitle: "Butt workout"),
        FitnessCategory(title: "手臂運動", imageName: "4", secondTitle: "Arm workout"),
        FitnessCategory(title: "腿部運動", imageName: "5", secondTitle: "Leg workout")
    ]
    
    //swiftlint:disable line_length

    
    private let coreArray = [
        ListModel(videoImg: "Abs1", durationLbl: "7", videoTitle: "連續22天的腹肌訓練計畫", videoDescription: "FittingRoomTW", intensity: "入門", videoID: "EIoryEvS2Gc", actionModel:[ActionModel(youtubeTime: "115", timesDescription: "45秒", actionDescription: "仰臥抬腿 ", restTime: "30"),
                                                                                                                                                                                                    ActionModel(youtubeTime: "164", timesDescription: "45秒", actionDescription: "側步棒式", restTime: "30"),
                                                                                                                                                                                                    ActionModel(youtubeTime: "200", timesDescription: "12下", actionDescription: "X卷腹", restTime: "30"),
                                                                                                                                                                                                    ActionModel(youtubeTime: "233", timesDescription: "每邊10下", actionDescription: "旋轉側棒式", restTime: "30"),
                                                                                                                                                                                                    ActionModel(youtubeTime: "288", timesDescription: "45秒", actionDescription: "屈體", restTime: "30"),
                                                                                                                                                                                                    ActionModel(youtubeTime: "330", timesDescription: "30秒﻿", actionDescription: "固定單車式捲腹", restTime: "30")]),
        ListModel(videoImg: "Abs2", durationLbl: "3", videoTitle: "3分鐘的腹部訓練", videoDescription: "FittingRoomTW", intensity: "入門", videoID: "https://youtu.be/HjP9GUWTft4", actionModel:[ActionModel(youtubeTime: "115", timesDescription: "30秒", actionDescription: "登山者 ", restTime: "30"),
                                                                                                                                                                                                    ActionModel(youtubeTime: "164", timesDescription: "30秒", actionDescription: "捲腹", restTime: "30"),
                                                                                                                                                                                                    ActionModel(youtubeTime: "3232323232", timesDescription: "30秒﻿", actionDescription: "棒式滑步", restTime: "30"),
                                                                                                                                                                                                    ActionModel(youtubeTime: "3232323", timesDescription: "30秒﻿", actionDescription: "V型捲腹", restTime: "30"),
                                                                                                                                                                                                    ActionModel(youtubeTime: "323232323", timesDescription: "30秒﻿", actionDescription: "棒式小跳", restTime: "30"),
                                                                                                                                                                                                    ActionModel(youtubeTime: "323232323", timesDescription: "30秒﻿", actionDescription: "全仰臥起坐", restTime: "30")])
    ]
    
    
    
        private let absArray = [
            ListModel(videoImg: "Core1", durationLbl: "7", videoTitle: "連續22天的腹肌訓練計畫", videoDescription: "FittingRoomTW", intensity: "入門", videoID: "EIoryEvS2Gc", actionModel:[ActionModel(youtubeTime: "115", timesDescription: "45秒", actionDescription: "仰臥抬腿 ", restTime: "30"),
                                                                                                                                                                                                        ActionModel(youtubeTime: "164", timesDescription: "45秒", actionDescription: "側步棒式", restTime: "30"),
                                                                                                                                                                                                        ActionModel(youtubeTime: "200", timesDescription: "12下", actionDescription: "X卷腹", restTime: "30"),
                                                                                                                                                                                                        ActionModel(youtubeTime: "233", timesDescription: "每邊10下", actionDescription: "旋轉側棒式", restTime: "30"),
                                                                                                                                                                                                        ActionModel(youtubeTime: "288", timesDescription: "45秒", actionDescription: "屈體", restTime: "30"),
                                                                                                                                                                                                        ActionModel(youtubeTime: "330", timesDescription: "30秒﻿", actionDescription: "固定單車式捲腹", restTime: "30")]),
        ]
    
        private let buttArray = [
            ListModel(videoImg: "Core1", durationLbl: "7", videoTitle: "連續22天的腹肌訓練計畫", videoDescription: "FittingRoomTW", intensity: "入門", videoID: "EIoryEvS2Gc", actionModel:[ActionModel(youtubeTime: "115", timesDescription: "45秒", actionDescription: "仰臥抬腿 ", restTime: "30"),
                                                                                                                                                                                                          ActionModel(youtubeTime: "164", timesDescription: "45秒", actionDescription: "側步棒式", restTime: "30"),
                                                                                                                                                                                                          ActionModel(youtubeTime: "200", timesDescription: "12下", actionDescription: "X卷腹", restTime: "30"),
                                                                                                                                                                                                          ActionModel(youtubeTime: "233", timesDescription: "每邊10下", actionDescription: "旋轉側棒式", restTime: "30"),
                                                                                                                                                                                                          ActionModel(youtubeTime: "288", timesDescription: "45秒", actionDescription: "屈體", restTime: "30"),
                                                                                                                                                                                                          ActionModel(youtubeTime: "330", timesDescription: "30秒﻿", actionDescription: "固定單車式捲腹", restTime: "30")]),
        ]
    
        private let armArray = [
            ListModel(videoImg: "Core1", durationLbl: "7", videoTitle: "連續22天的腹肌訓練計畫", videoDescription: "FittingRoomTW", intensity: "入門", videoID: "EIoryEvS2Gc", actionModel:[ActionModel(youtubeTime: "115", timesDescription: "45秒", actionDescription: "仰臥抬腿 ", restTime: "30"),
                                                                                                                                                                                                        ActionModel(youtubeTime: "164", timesDescription: "45秒", actionDescription: "側步棒式", restTime: "30"),
                                                                                                                                                                                                        ActionModel(youtubeTime: "200", timesDescription: "12下", actionDescription: "X卷腹", restTime: "30"),
                                                                                                                                                                                                        ActionModel(youtubeTime: "233", timesDescription: "每邊10下", actionDescription: "旋轉側棒式", restTime: "30"),
                                                                                                                                                                                                        ActionModel(youtubeTime: "288", timesDescription: "45秒", actionDescription: "屈體", restTime: "30"),
                                                                                                                                                                                                        ActionModel(youtubeTime: "330", timesDescription: "30秒﻿", actionDescription: "固定單車式捲腹", restTime: "30")]),
        ]
    
        private let legArray = [
            ListModel(videoImg: "Core1", durationLbl: "7", videoTitle: "連續22天的腹肌訓練計畫", videoDescription: "FittingRoomTW", intensity: "入門", videoID: "EIoryEvS2Gc", actionModel:[ActionModel(youtubeTime: "115", timesDescription: "45秒", actionDescription: "仰臥抬腿 ", restTime: "30"),
                                                                                                                                                                                                        ActionModel(youtubeTime: "164", timesDescription: "45秒", actionDescription: "側步棒式", restTime: "30"),
                                                                                                                                                                                                        ActionModel(youtubeTime: "200", timesDescription: "12下", actionDescription: "X卷腹", restTime: "30"),
                                                                                                                                                                                                        ActionModel(youtubeTime: "233", timesDescription: "每邊10下", actionDescription: "旋轉側棒式", restTime: "30"),
                                                                                                                                                                                                        ActionModel(youtubeTime: "288", timesDescription: "45秒", actionDescription: "屈體", restTime: "30"),
                                                                                                                                                                                                        ActionModel(youtubeTime: "330", timesDescription: "30秒﻿", actionDescription: "固定單車式捲腹", restTime: "30")]),        ]
    
    
    
    private let workout = [ListModel]()
    
    func getfitCategories() -> [FitnessCategory] {
        return fitCategories
    }
    
    func getList(forListTitle title: String) -> [ListModel]{
        switch title {
        case "Core workout":
            return getCore()
                    case "Abs workout":
                        return getAbs()
                    case "Butt workout":
                        return getButt()
                    case "Arm workout":
                        return getArm()
                    case "Leg workout":
                        return getLeg()
        
        default:
            return getCore()
        }
    }
    ////
    func getCore() -> [ListModel]{
        return coreArray
    }
    
        func getAbs() -> [ListModel]{
            return armArray
        }
    
        func getButt() -> [ListModel]{
            return buttArray
        }
    
        func getArm() -> [ListModel]{
            return armArray
        }
    
        func getLeg() -> [ListModel]{
            return legArray
        }
}
