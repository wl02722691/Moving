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
        
        
        ListModel(videoImg: "Arm1", durationLbl: 6, videoTitle: "快速瘦手臂操收拜拜肉", videoDescription: "Coffee林芊妤", intensity: "入門", videoID: "C8oSs8qf_7g", timeRange: TimeRange.threeToNine, actionModel: [
            
            
            ActionModel(youtubeTime: 60, stopTime: 20, restTime: 10, timesDescription: 40, actionDescription: "40次動作1", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            
            ActionModel(youtubeTime: 88, stopTime: 50, restTime: 10, timesDescription: 40, actionDescription: "40次動作2", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            
            ActionModel(youtubeTime: 150, stopTime: 70, restTime: 10, timesDescription: 50, actionDescription: "40次動作3", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            
            ActionModel(youtubeTime: 223, stopTime: 50, restTime: 10, timesDescription: 50, actionDescription: "20次動作4", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            
            ActionModel(youtubeTime: 277, stopTime: 50, restTime: 10, timesDescription: 50, actionDescription: "20次動作5", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            
            ]),
        
        ListModel(videoImg: "Leg1", durationLbl: 11, videoTitle: "特快瘦大腿1個月內見效", videoDescription: "Coffee林芊妤" , intensity: "入門", videoID: "3X1PL7ym04I", timeRange: TimeRange.min9, actionModel: [
            
            ActionModel(youtubeTime: 67, stopTime: 60, restTime: 10, timesDescription: 50, actionDescription: "左右20次", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 140, stopTime: 60, restTime: 10, timesDescription: 50, actionDescription: "左右20次", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 214, stopTime: 60, restTime: 10, timesDescription: 50, actionDescription: "升起20次", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 279, stopTime: 60, restTime: 10, timesDescription: 50, actionDescription: "升起20次", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 353, stopTime: 60, restTime: 10, timesDescription: 50, actionDescription: "升起20次", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 438, stopTime: 60, restTime: 10, timesDescription: 50, actionDescription: "升起20次", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 438, stopTime: 60, restTime: 10, timesDescription: 50, actionDescription: "畫圈20次﻿", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            
            
            
            ]),
        
   
        
        ListModel(videoImg: "Abs1", durationLbl: 7, videoTitle: "連續22天的腹肌訓練計畫", videoDescription: "FittingRoomTW", intensity: "入門", videoID: "EIoryEvS2Gc", timeRange: TimeRange.threeToNine, actionModel: [
            
            ActionModel(youtubeTime: 115.0, stopTime: 15, restTime: 30, timesDescription: 45, actionDescription: "仰臥抬腿", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 164.0, stopTime: 20.0, restTime: 30, timesDescription: 45, actionDescription: "側步棒式", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 200.0, stopTime: 20.0, restTime: 30, timesDescription: 40.0, actionDescription: "12次X卷腹", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 233.0, stopTime: 37.0, restTime: 30, timesDescription: 40.0, actionDescription: "10次左側旋轉側棒式", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 233.0, stopTime: 37.0, restTime: 30, timesDescription: 40.0, actionDescription: "10次右側旋轉側棒式", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 289.0, stopTime: 23.0, restTime: 30, timesDescription: 45.0, actionDescription: "屈體", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 330.0, stopTime: 330.0, restTime: 30, timesDescription: 30, actionDescription: "固定單車式捲腹", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false)
            
            
            ]),
        
        
        
        ]
    
    
    
    private let absArray = [
        
        ListModel(videoImg: "Abs1", durationLbl: 7, videoTitle: "連續22天的腹肌訓練計畫", videoDescription: "FittingRoomTW", intensity: "入門", videoID: "EIoryEvS2Gc", timeRange: TimeRange.threeToNine, actionModel: [
            
            ActionModel(youtubeTime: 115.0, stopTime: 15, restTime: 30, timesDescription: 45, actionDescription: "仰臥抬腿", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 164.0, stopTime: 20.0, restTime: 30, timesDescription: 45, actionDescription: "側步棒式", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 200.0, stopTime: 20.0, restTime: 30, timesDescription: 40.0, actionDescription: "12次X卷腹", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 233.0, stopTime: 37.0, restTime: 30, timesDescription: 40.0, actionDescription: "10次左側旋轉側棒式", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 233.0, stopTime: 37.0, restTime: 30, timesDescription: 40.0, actionDescription: "10次右側旋轉側棒式", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 289.0, stopTime: 23.0, restTime: 30, timesDescription: 45.0, actionDescription: "屈體", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 330.0, stopTime: 330.0, restTime: 30, timesDescription: 45, actionDescription: "固定單車式捲腹", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false)
            ]),
    ]
    
    
    private let armArray = [
        
        ListModel(videoImg: "Arm1", durationLbl: 6, videoTitle: "快速瘦手臂操 (收拜拜肉及減少副乳)", videoDescription: "Coffee林芊妤", intensity: "入門", videoID: "C8oSs8qf_7g", timeRange: TimeRange.min9, actionModel: [
            
            
            ActionModel(youtubeTime: 60, stopTime: 20, restTime: 5, timesDescription: 30, actionDescription: "40次動作1", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            
            ActionModel(youtubeTime: 88, stopTime: 50, restTime: 5, timesDescription: 30, actionDescription: "40次動作2", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            
            ActionModel(youtubeTime: 150, stopTime: 70, restTime: 5, timesDescription: 50, actionDescription: "40次動作3", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            
            ActionModel(youtubeTime: 223, stopTime: 50, restTime: 5, timesDescription: 50, actionDescription: "20次動作4", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            
            ActionModel(youtubeTime: 277, stopTime: 50, restTime: 5, timesDescription: 50, actionDescription: "20次動作5", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            
            ]),
        
        
        
        ListModel(videoImg: "Abs1", durationLbl: 7, videoTitle: "連續22天的腹肌訓練計畫", videoDescription: "FittingRoomTW", intensity: "入門", videoID: "EIoryEvS2Gc", timeRange: TimeRange.threeToNine, actionModel: [
            
            ActionModel(youtubeTime: 115.0, stopTime: 15, restTime: 30, timesDescription: 45, actionDescription: "仰臥抬腿", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 164.0, stopTime: 20.0, restTime: 30, timesDescription: 45, actionDescription: "側步棒式", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 200.0, stopTime: 20.0, restTime: 30, timesDescription: 40.0, actionDescription: "12次X卷腹", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 233.0, stopTime: 37.0, restTime: 30, timesDescription: 40.0, actionDescription: "10次左側旋轉側棒式", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 233.0, stopTime: 37.0, restTime: 30, timesDescription: 40.0, actionDescription: "10次右側旋轉側棒式", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 289.0, stopTime: 23.0, restTime: 30, timesDescription: 45.0, actionDescription: "屈體", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 330.0, stopTime: 330.0, restTime: 30, timesDescription: 45, actionDescription: "固定單車式捲腹", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false)
            ]),
                   
        ]
    
        
    
    private let buttArray = [
        
        
        ListModel(videoImg: "Leg1", durationLbl: 11, videoTitle: "特快瘦大腿1個月內見效", videoDescription: "Coffee林芊妤" , intensity: "入門", videoID: "3X1PL7ym04I", timeRange: TimeRange.min9, actionModel: [
            
           ActionModel(youtubeTime: 67, stopTime: 60, restTime: 10, timesDescription: 50, actionDescription: "左右20次", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 140, stopTime: 60, restTime: 10, timesDescription: 50, actionDescription: "左右20次", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 214, stopTime: 60, restTime: 10, timesDescription: 50, actionDescription: "升起20次", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 279, stopTime: 60, restTime: 10, timesDescription: 50, actionDescription: "升起20次", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 353, stopTime: 60, restTime: 10, timesDescription: 50, actionDescription: "升起20次", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 438, stopTime: 60, restTime: 10, timesDescription: 50, actionDescription: "升起20次", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 438, stopTime: 60, restTime: 10, timesDescription: 50, actionDescription: "畫圈20次﻿", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            
            
            
            ]),
        
        
        ListModel(videoImg: "Abs1", durationLbl: 7, videoTitle: "連續22天的腹肌訓練計畫", videoDescription: "FittingRoomTW", intensity: "入門", videoID: "EIoryEvS2Gc", timeRange: TimeRange.threeToNine, actionModel: [
            
            ActionModel(youtubeTime: 115.0, stopTime: 15, restTime: 30, timesDescription: 45, actionDescription: "仰臥抬腿", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 164.0, stopTime: 20.0, restTime: 30, timesDescription: 45, actionDescription: "側步棒式", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 200.0, stopTime: 20.0, restTime: 30, timesDescription: 40.0, actionDescription: "12次X卷腹", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 233.0, stopTime: 37.0, restTime: 30, timesDescription: 40.0, actionDescription: "10次左側旋轉側棒式", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 233.0, stopTime: 37.0, restTime: 30, timesDescription: 40.0, actionDescription: "10次右側旋轉側棒式", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 289.0, stopTime: 23.0, restTime: 30, timesDescription: 45.0, actionDescription: "屈體", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 330.0, stopTime: 330.0, restTime: 30, timesDescription: 30, actionDescription: "固定單車式捲腹", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false)
            ]),
        
        ]
    

    private let legArray = [
        
        ListModel(videoImg: "Arm1", durationLbl: 6, videoTitle: "快速瘦手臂操收拜拜肉", videoDescription: "Coffee林芊妤", intensity: "入門", videoID: "C8oSs8qf_7g", timeRange: TimeRange.min9, actionModel: [
            
            
            ActionModel(youtubeTime: 60, stopTime: 20, restTime: 10, timesDescription: 10, actionDescription: "40次動作1", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            
            ActionModel(youtubeTime: 88, stopTime: 50, restTime: 10, timesDescription: 10, actionDescription: "40次動作2", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            
            ActionModel(youtubeTime: 150, stopTime: 70, restTime: 10, timesDescription: 10, actionDescription: "40次動作3", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            
            ActionModel(youtubeTime: 223, stopTime: 50, restTime: 10, timesDescription: 10, actionDescription: "20次動作4", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            
            ActionModel(youtubeTime: 277, stopTime: 50, restTime: 10, timesDescription: 10, actionDescription: "20次動作5", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            
            ]),
        
        
        ]
    
    private let scoreArray = [
        ScoreModel(scoreImg: "score_1", titleLbl: "輕鬆"),ScoreModel(scoreImg: "score_2", titleLbl: "適中"),ScoreModel(scoreImg: "score_3", titleLbl: "挑戰級"),ScoreModel(scoreImg: "score_4", titleLbl: "極為吃力")
    ]
    
    private let settingArray = [
        
        SettingModel(titleLbl: "關於 FitnessLab", statusLbl: ""),
        SettingModel(titleLbl: "意見回饋", statusLbl: ""),
        SettingModel(titleLbl: "評分鼓勵", statusLbl: ""),
        SettingModel(titleLbl: "每日運動推播", statusLbl: "20:30"),
        SettingModel(titleLbl: "語言設定", statusLbl: "繁體中文"),
      
        ]
    
    private let settingSwitchArray = [
        
        SettingSwitchModel(titleLbl: "提示音設定", statusSwitch: false),
        SettingSwitchModel(titleLbl: "iCloud 備份", statusSwitch: false),
        SettingSwitchModel(titleLbl: "Apple Health", statusSwitch: false),
        
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
        return absArray
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
