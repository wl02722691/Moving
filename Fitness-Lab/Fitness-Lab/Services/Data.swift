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
        ListModel(videoImg: "Abs3", durationLbl: "7", videoTitle: "連續22天的腹肌訓練計畫", videoDescription: "FittingRoomTW", intensity: "入門", videoID: "EIoryEvS2Gc", actionModel: [ActionModel(youtubeTime: 115, stopTime: 16, restTime: 10, timesDescription: 45, actionDescription: "仰臥抬腿"),ActionModel(youtubeTime: 164, stopTime: 20, restTime: 10, timesDescription: 45, actionDescription: "側步棒式"),ActionModel(youtubeTime: 200, stopTime: 20, restTime: 30, timesDescription: 40, actionDescription: "12次X卷腹"),ActionModel(youtubeTime:233, stopTime: 37, restTime: 10, timesDescription: 40, actionDescription: "10次左側旋轉側棒式"),ActionModel(youtubeTime:233, stopTime: 37, restTime: 10, timesDescription: 40, actionDescription: "10次右側旋轉側棒式"),ActionModel(youtubeTime: 289, stopTime: 23, restTime: 10, timesDescription: 45, actionDescription: "屈體"),ActionModel(youtubeTime: 330, stopTime: 25 , restTime:10 , timesDescription: 45, actionDescription: "固定單車式捲腹")]),
        
        ListModel(videoImg: "Abs3", durationLbl: "7", videoTitle: "連續22天的腹肌訓練計畫", videoDescription: "FittingRoomTW", intensity: "入門", videoID: "EIoryEvS2Gc", actionModel: [ActionModel(youtubeTime: 115, stopTime: 16, restTime: 10, timesDescription: 45, actionDescription: "仰臥抬腿"),ActionModel(youtubeTime: 164, stopTime: 20, restTime: 10, timesDescription: 20, actionDescription: "側步棒式"),ActionModel(youtubeTime: 200, stopTime: 20, restTime: 10, timesDescription: 10, actionDescription: "12次X卷腹"),ActionModel(youtubeTime:233, stopTime: 37, restTime: 10, timesDescription: 10, actionDescription: "10次左側旋轉側棒式"),ActionModel(youtubeTime:233, stopTime: 37, restTime: 10, timesDescription: 10, actionDescription: "10次右側旋轉側棒式"),ActionModel(youtubeTime: 289, stopTime: 23, restTime: 10, timesDescription: 10, actionDescription: "屈體"),ActionModel(youtubeTime: 330, stopTime: 25 , restTime:10 , timesDescription: 10, actionDescription: "固定單車式捲腹")]),
            
        ListModel(videoImg: "Abs2", durationLbl: "3", videoTitle: "3分鐘的腹部訓練", videoDescription: "FittingRoomTW", intensity: "入門", videoID: "HjP9GUWTft4", actionModel:
            [ActionModel(youtubeTime: 164, stopTime: 30, restTime: 30, timesDescription: 30, actionDescription: "登山者"),
                  ActionModel(youtubeTime: 200, stopTime: 30, restTime: 30, timesDescription: 30, actionDescription: "捲腹"),
                  ActionModel(youtubeTime: 30, stopTime: 30, restTime: 30, timesDescription: 30, actionDescription: "棒式滑步"),
                  ActionModel(youtubeTime: 30, stopTime: 30, restTime: 30, timesDescription: 30, actionDescription: "V型捲腹"),
                  ActionModel(youtubeTime: 100, stopTime: 30, restTime: 30, timesDescription: 30, actionDescription: "棒式小跳"),
                  ActionModel(youtubeTime: 100, stopTime: 30, restTime: 30, timesDescription: 30, actionDescription: "全仰臥起坐")]),
        ListModel(videoImg: "Abs1", durationLbl: "7", videoTitle: "連續22天的腹肌訓練計畫", videoDescription: "FittingRoomTW", intensity: "入門", videoID: "EIoryEvS2Gc", actionModel: [ActionModel(youtubeTime: 115, stopTime: 16, restTime: 30, timesDescription: 45, actionDescription: "仰臥抬腿"),ActionModel(youtubeTime: 164, stopTime: 20, restTime: 30, timesDescription: 45, actionDescription: "側步棒式"),ActionModel(youtubeTime: 164, stopTime: 20, restTime: 30, timesDescription: 40, actionDescription: "12次X卷腹"),ActionModel(youtubeTime:233, stopTime: 37, restTime: 30, timesDescription: 40, actionDescription: "10次左側旋轉側棒式"),ActionModel(youtubeTime:233, stopTime: 37, restTime: 30, timesDescription: 40, actionDescription: "10次右側旋轉側棒式"),ActionModel(youtubeTime: 288, stopTime: 23, restTime: 30, timesDescription: 45, actionDescription: "屈體"),ActionModel(youtubeTime: 288, stopTime: 25, restTime: 30, timesDescription: 45, actionDescription: "固定單車式捲腹")]),
        
        ListModel(videoImg: "Abs2", durationLbl: "3", videoTitle: "3分鐘的腹部訓練", videoDescription: "FittingRoomTW", intensity: "入門", videoID: "HjP9GUWTft4", actionModel:
            [ActionModel(youtubeTime: 164, stopTime: 30, restTime: 30, timesDescription: 30, actionDescription: "登山者"),
             ActionModel(youtubeTime: 200, stopTime: 30, restTime: 30, timesDescription: 30, actionDescription: "捲腹"),
             ActionModel(youtubeTime: 30, stopTime: 30, restTime: 30, timesDescription: 30, actionDescription: "棒式滑步"),
             ActionModel(youtubeTime: 30, stopTime: 30, restTime: 30, timesDescription: 30, actionDescription: "V型捲腹"),
             ActionModel(youtubeTime: 100, stopTime: 30, restTime: 30, timesDescription: 30, actionDescription: "棒式小跳"),
             ActionModel(youtubeTime: 100, stopTime: 30, restTime: 30, timesDescription: 30, actionDescription: "全仰臥起坐")]),
        
        ]
    
    private let buttArray = [
        ListModel(videoImg: "Abs1", durationLbl: "7", videoTitle: "連續22天的腹肌訓練計畫", videoDescription: "FittingRoomTW", intensity: "入門", videoID: "EIoryEvS2Gc", actionModel: [ActionModel(youtubeTime: 115, stopTime: 16, restTime: 30, timesDescription: 45, actionDescription: "仰臥抬腿"),ActionModel(youtubeTime: 164, stopTime: 20, restTime: 30, timesDescription: 45, actionDescription: "側步棒式"),ActionModel(youtubeTime: 164, stopTime: 20, restTime: 30, timesDescription: 40, actionDescription: "12次X卷腹"),ActionModel(youtubeTime:233, stopTime: 37, restTime: 30, timesDescription: 40, actionDescription: "10次左側旋轉側棒式"),ActionModel(youtubeTime:233, stopTime: 37, restTime: 30, timesDescription: 40, actionDescription: "10次右側旋轉側棒式"),ActionModel(youtubeTime: 288, stopTime: 23, restTime: 30, timesDescription: 45, actionDescription: "屈體"),ActionModel(youtubeTime: 288, stopTime: 25, restTime: 30, timesDescription: 45, actionDescription: "固定單車式捲腹")]),
        
        ListModel(videoImg: "Abs2", durationLbl: "3", videoTitle: "3分鐘的腹部訓練", videoDescription: "FittingRoomTW", intensity: "入門", videoID: "HjP9GUWTft4", actionModel:
            [ActionModel(youtubeTime: 164, stopTime: 30, restTime: 30, timesDescription: 30, actionDescription: "登山者"),
             ActionModel(youtubeTime: 200, stopTime: 30, restTime: 30, timesDescription: 30, actionDescription: "捲腹"),
             ActionModel(youtubeTime: 30, stopTime: 30, restTime: 30, timesDescription: 30, actionDescription: "棒式滑步"),
             ActionModel(youtubeTime: 30, stopTime: 30, restTime: 30, timesDescription: 30, actionDescription: "V型捲腹"),
             ActionModel(youtubeTime: 100, stopTime: 30, restTime: 30, timesDescription: 30, actionDescription: "棒式小跳"),
             ActionModel(youtubeTime: 100, stopTime: 30, restTime: 30, timesDescription: 30, actionDescription: "全仰臥起坐")]),
    ]
    
        private let armArray = [
            ListModel(videoImg: "Abs1", durationLbl: "7", videoTitle: "連續22天的腹肌訓練計畫", videoDescription: "FittingRoomTW", intensity: "入門", videoID: "EIoryEvS2Gc", actionModel: [ActionModel(youtubeTime: 115, stopTime: 16, restTime: 30, timesDescription: 45, actionDescription: "仰臥抬腿"),ActionModel(youtubeTime: 164, stopTime: 20, restTime: 30, timesDescription: 45, actionDescription: "側步棒式"),ActionModel(youtubeTime: 164, stopTime: 20, restTime: 30, timesDescription: 40, actionDescription: "12次X卷腹"),ActionModel(youtubeTime:233, stopTime: 37, restTime: 30, timesDescription: 40, actionDescription: "10次左側旋轉側棒式"),ActionModel(youtubeTime:233, stopTime: 37, restTime: 30, timesDescription: 40, actionDescription: "10次右側旋轉側棒式"),ActionModel(youtubeTime: 288, stopTime: 23, restTime: 30, timesDescription: 45, actionDescription: "屈體"),ActionModel(youtubeTime: 288, stopTime: 25, restTime: 30, timesDescription: 45, actionDescription: "固定單車式捲腹")]),
            
            ListModel(videoImg: "Abs2", durationLbl: "3", videoTitle: "3分鐘的腹部訓練", videoDescription: "FittingRoomTW", intensity: "入門", videoID: "HjP9GUWTft4", actionModel:
                [ActionModel(youtubeTime: 164, stopTime: 30, restTime: 30, timesDescription: 30, actionDescription: "登山者"),
                 ActionModel(youtubeTime: 200, stopTime: 30, restTime: 30, timesDescription: 30, actionDescription: "捲腹"),
                 ActionModel(youtubeTime: 30, stopTime: 30, restTime: 30, timesDescription: 30, actionDescription: "棒式滑步"),
                 ActionModel(youtubeTime: 30, stopTime: 30, restTime: 30, timesDescription: 30, actionDescription: "V型捲腹"),
                 ActionModel(youtubeTime: 100, stopTime: 30, restTime: 30, timesDescription: 30, actionDescription: "棒式小跳"),
                 ActionModel(youtubeTime: 100, stopTime: 30, restTime: 30, timesDescription: 30, actionDescription: "全仰臥起坐")]),
        ]
    
        private let legArray = [
            ListModel(videoImg: "Abs1", durationLbl: "7", videoTitle: "連續22天的腹肌訓練計畫", videoDescription: "FittingRoomTW", intensity: "入門", videoID: "EIoryEvS2Gc", actionModel: [ActionModel(youtubeTime: 115, stopTime: 16, restTime: 30, timesDescription: 45, actionDescription: "仰臥抬腿"),ActionModel(youtubeTime: 164, stopTime: 20, restTime: 30, timesDescription: 45, actionDescription: "側步棒式"),ActionModel(youtubeTime: 164, stopTime: 20, restTime: 30, timesDescription: 40, actionDescription: "12次X卷腹"),ActionModel(youtubeTime:233, stopTime: 37, restTime: 30, timesDescription: 40, actionDescription: "10次左側旋轉側棒式"),ActionModel(youtubeTime:233, stopTime: 37, restTime: 30, timesDescription: 40, actionDescription: "10次右側旋轉側棒式"),ActionModel(youtubeTime: 288, stopTime: 23, restTime: 30, timesDescription: 45, actionDescription: "屈體"),ActionModel(youtubeTime: 288, stopTime: 25, restTime: 30, timesDescription: 45, actionDescription: "固定單車式捲腹")]),
            
            ListModel(videoImg: "Abs2", durationLbl: "3", videoTitle: "3分鐘的腹部訓練", videoDescription: "FittingRoomTW", intensity: "入門", videoID: "HjP9GUWTft4", actionModel:
                [ActionModel(youtubeTime: 1, stopTime: 1, restTime: 1, timesDescription: 1, actionDescription: "登山者"),
                 ActionModel(youtubeTime: 1, stopTime: 1, restTime: 1, timesDescription: 1, actionDescription: "捲腹"),
                 ActionModel(youtubeTime: 1, stopTime: 1, restTime: 1, timesDescription: 1, actionDescription: "棒式滑步"),
                 ActionModel(youtubeTime: 1, stopTime: 1, restTime: 1, timesDescription: 1, actionDescription: "V型捲腹"),
                 ActionModel(youtubeTime: 1, stopTime: 1, restTime: 1, timesDescription: 1, actionDescription: "棒式小跳"),
                 ActionModel(youtubeTime: 1, stopTime: 1, restTime: 1, timesDescription: 1, actionDescription: "全仰臥起坐")]),
    ]
    
    private let scoreArray = [
        ScoreModel(scoreImg: "score_1", titleLbl: "輕鬆"),ScoreModel(scoreImg: "score_2", titleLbl: "適中"),ScoreModel(scoreImg: "score_3", titleLbl: "挑戰級"),ScoreModel(scoreImg: "score_4", titleLbl: "極為吃力")
    ]
    
    private let settingArray = [
        SettingModel(titleLbl: "每日運動推播", statusLbl: "20:30"),
        SettingModel(titleLbl: "語言設定", statusLbl: "繁體中文"),
        SettingModel(titleLbl: "Apple Health", statusLbl: "連接成功"),
        SettingModel(titleLbl: "提示音設定", statusLbl: "開啟"),
        SettingModel(titleLbl: "icloud 備份", statusLbl: "尚未備份")

    ]
    
    
    
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
    
    
    func getScoreArray() -> [ScoreModel]{
        return scoreArray
    }
    
    
    func getSettingArray() -> [SettingModel]{
        return settingArray
    }
}
