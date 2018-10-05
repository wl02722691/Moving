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
    
    //swiftlint:disable colon
    //swiftlint:disable comma
    //swiftlint:disable line_length
    
    private let coreArray = [
   
        ListModel(videoImg: "Abs3", durationLbl: "7", videoTitle: "連續22天的腹肌訓練計畫", videoDescription: "FittingRoomTW", intensity: "入門", videoID: "EIoryEvS2Gc", actionModel:[
            ActionModel(youtubeTime: 115.0, stopTime: 115.0, restTime: 10.0, timesDescription: 45.0, actionDescription: "仰臥抬腿", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action),ActionModel(youtubeTime: 164.0, stopTime: 20.0, restTime: 10.0, timesDescription: 45.0, actionDescription: "側步棒式", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action),ActionModel(youtubeTime: 200.0, stopTime: 20.0, restTime: 10.0, timesDescription: 45.0, actionDescription: "側步棒式", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action),ActionModel(youtubeTime: 164.0, stopTime: 20.0, restTime: 10.0, timesDescription: 45.0, actionDescription: "側步棒式", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action),ActionModel(youtubeTime: 200.0, stopTime: 20.0, restTime: 10.0, timesDescription: 40.0, actionDescription: "12次X卷腹", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action),ActionModel(youtubeTime: 233.0, stopTime: 37.0, restTime: 10.0, timesDescription: 40.0, actionDescription: "10次左側旋轉側棒式", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action),ActionModel(youtubeTime: 200.0, stopTime: 20.0, restTime: 10.0, timesDescription: 40.0, actionDescription: "12次X卷腹", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action),ActionModel(youtubeTime: 233.0, stopTime: 37.0, restTime: 10.0, timesDescription: 40.0, actionDescription: "10次右側旋轉側棒式", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action),ActionModel(youtubeTime: 289.0, stopTime: 23.0, restTime: 10.0, timesDescription: 45.0, actionDescription: "屈體", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action),ActionModel(youtubeTime: 330.0, stopTime: 25.0, restTime: 10.0, timesDescription: 45.0, actionDescription: "固定單車式捲腹", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action)]),
        
        ListModel(videoImg: "Abs3", durationLbl: "7", videoTitle: "連續22天的腹肌訓練計畫", videoDescription: "FittingRoomTW", intensity: "入門", videoID: "EIoryEvS2Gc", actionModel:[
            ActionModel(youtubeTime: 115.0, stopTime: 115.0, restTime: 10.0, timesDescription: 10, actionDescription: "仰臥抬腿", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action),ActionModel(youtubeTime: 164.0, stopTime: 20.0, restTime: 10.0, timesDescription: 10, actionDescription: "側步棒式", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action),ActionModel(youtubeTime: 200.0, stopTime: 20.0, restTime: 10.0, timesDescription: 10, actionDescription: "側步棒式", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action),ActionModel(youtubeTime: 164.0, stopTime: 20.0, restTime: 10.0, timesDescription: 10, actionDescription: "側步棒式", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action),ActionModel(youtubeTime: 200.0, stopTime: 20.0, restTime: 10.0, timesDescription: 10, actionDescription: "12次X卷腹", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action),ActionModel(youtubeTime: 233.0, stopTime: 37.0, restTime: 10.0, timesDescription: 10, actionDescription: "10次左側旋轉側棒式", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action),ActionModel(youtubeTime: 200.0, stopTime: 20.0, restTime: 10.0, timesDescription: 10, actionDescription: "12次X卷腹", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action),ActionModel(youtubeTime: 233.0, stopTime: 37.0, restTime: 10.0, timesDescription: 10, actionDescription: "10次右側旋轉側棒式", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action),ActionModel(youtubeTime: 289.0, stopTime: 23.0, restTime: 10.0, timesDescription: 10, actionDescription: "屈體", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action),ActionModel(youtubeTime: 330.0, stopTime: 25.0, restTime: 10.0, timesDescription: 10, actionDescription: "固定單車式捲腹", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action),])
        

        ]
    
    private let buttArray = [
              ListModel(videoImg: "Abs2", durationLbl: "3", videoTitle: "3分鐘的腹部訓練", videoDescription: "FittingRoomTW", intensity: "FittingRoomTW", videoID: "HjP9GUWTft4", actionModel: [ActionModel(youtubeTime: 1, stopTime: 1, restTime: 1, timesDescription: 1, actionDescription: "登山者", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action)]),
        ]
    
    private let armArray = [
            ListModel(videoImg: "Abs2", durationLbl: "3", videoTitle: "3分鐘的腹部訓練", videoDescription: "FittingRoomTW", intensity: "FittingRoomTW", videoID: "HjP9GUWTft4", actionModel: [ActionModel(youtubeTime: 1, stopTime: 1, restTime: 1, timesDescription: 1, actionDescription: "登山者", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action)]),
        ]
    
    private let legArray = [
       
        ListModel(videoImg: "Abs2", durationLbl: "3", videoTitle: "3分鐘的腹部訓練", videoDescription: "FittingRoomTW", intensity: "FittingRoomTW", videoID: "HjP9GUWTft4", actionModel: [ActionModel(youtubeTime: 1, stopTime: 1, restTime: 1, timesDescription: 1, actionDescription: "登山者", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action)]),
        
        ]
    
    private let scoreArray = [
        ScoreModel(scoreImg: "score_1", titleLbl: "輕鬆"),ScoreModel(scoreImg: "score_2", titleLbl: "適中"),ScoreModel(scoreImg: "score_3", titleLbl: "挑戰級"),ScoreModel(scoreImg: "score_4", titleLbl: "極為吃力")
    ]
    
    private let settingArray = [
        SettingModel(titleLbl: "每日運動推播", statusLbl: "20:30"),
        SettingModel(titleLbl: "語言設定", statusLbl: "繁體中文")
        
        ]
    
    private let settingSwitchArray = [
        
        SettingSwitchModel(titleLbl: "Apple Health", statusSwitch: false),
        SettingSwitchModel(titleLbl: "提示音設定", statusSwitch: false),
        SettingSwitchModel(titleLbl: "iCloud 備份", statusSwitch: false)
        ]
    
    private let workout = [ListModel]()
    
    func getfitCategories() -> [FitnessCategory] {
        return fitCategories
    }
    
    func getList(forListTitle title: String) -> [ListModel] {
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

    func getCore() -> [ListModel] {
        return coreArray
    }
    
    func getAbs() -> [ListModel] {
        return armArray
    }
    
    func getButt() -> [ListModel] {
        return buttArray
    }
    
    func getArm() -> [ListModel] {
        return armArray
    }
    
    func getLeg() -> [ListModel] {
        return legArray
    }
    
    func getScoreArray() -> [ScoreModel] {
        return scoreArray
    }
    
    func getSettingArray() -> [SettingModel] {
        return settingArray
    }
    
    func getSettingSwitchArray() -> [SettingSwitchModel] {
        return settingSwitchArray
    }
}
