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
            
            
            ActionModel(youtubeTime: 100, stopTime: 100, restTime: 15, timesDescription: 15, actionDescription: "Alice cutest", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            
            ActionModel(youtubeTime: 100, stopTime: 100, restTime: 15, timesDescription: 15, actionDescription: "Alice cutest", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            
            ActionModel(youtubeTime: 100, stopTime: 100, restTime: 15, timesDescription: 15, actionDescription: "Alice cutest", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            
            ActionModel(youtubeTime: 100, stopTime: 100, restTime: 15, timesDescription: 15, actionDescription: "Alice cutest", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            
            ActionModel(youtubeTime: 100, stopTime: 100, restTime: 15, timesDescription: 15, actionDescription: "Alice cutest", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            
            ActionModel(youtubeTime: 100, stopTime: 100, restTime: 15, timesDescription: 15, actionDescription: "Alice cutest", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            
            ActionModel(youtubeTime: 100, stopTime: 100, restTime: 15, timesDescription: 15, actionDescription: "Alice cutest", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            
            ActionModel(youtubeTime: 100, stopTime: 100, restTime: 15, timesDescription: 15, actionDescription: "Alice cutest", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 100, stopTime: 100, restTime: 15, timesDescription: 15, actionDescription: "Alice cutest", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            
            ActionModel(youtubeTime: 100, stopTime: 100, restTime: 15, timesDescription: 15, actionDescription: "Alice cutest", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            
            ActionModel(youtubeTime: 100, stopTime: 100, restTime: 15, timesDescription: 15, actionDescription: "Alice cutest", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            
            ActionModel(youtubeTime: 100, stopTime: 100, restTime: 15, timesDescription: 15, actionDescription: "Alice cutest", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            
            ActionModel(youtubeTime: 100, stopTime: 100, restTime: 15, timesDescription: 15, actionDescription: "Alice cutest", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            
            ActionModel(youtubeTime: 100, stopTime: 100, restTime: 15, timesDescription: 15, actionDescription: "Alice cutest", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            
            ActionModel(youtubeTime: 100, stopTime: 100, restTime: 15, timesDescription: 15, actionDescription: "Alice cutest", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            
            ActionModel(youtubeTime: 100, stopTime: 100, restTime: 15, timesDescription: 15, actionDescription: "Alice cutest", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ]),
        
        
        ]
        
    
    private let buttArray = [
        
        ListModel(videoImg: "Abs3", durationLbl: "7", videoTitle: "連續22天的腹肌訓練計畫", videoDescription: "FittingRoomTW", intensity: "入門", videoID: "EIoryEvS2Gc", actionModel:[
           
            
            ActionModel(youtubeTime: 100, stopTime: 100, restTime: 15, timesDescription: 15, actionDescription: "Alice cutest", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            
            ])
        ]
    
    private let armArray = [
        ListModel(videoImg: "Abs3", durationLbl: "7", videoTitle: "連續22天的腹肌訓練計畫", videoDescription: "FittingRoomTW", intensity: "入門", videoID: "EIoryEvS2Gc", actionModel:[
    
        
            ActionModel(youtubeTime: 100, stopTime: 100, restTime: 15, timesDescription: 15, actionDescription: "Alice cutest", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ]),
        ]
    
    private let legArray = [
        ListModel(videoImg: "Abs3", durationLbl: "7", videoTitle: "連續22天的腹肌訓練計畫", videoDescription: "FittingRoomTW", intensity: "入門", videoID: "EIoryEvS2Gc", actionModel:[
            
            
            ActionModel(youtubeTime: 100, stopTime: 100, restTime: 15, timesDescription: 15, actionDescription: "Alice cutest", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            
            
            
            ]),
        
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
