//
//  Data.swift
//  Fitness-Lab
//
//  Created by 張書涵 on 2018/9/20.
//  Copyright © 2018年 AliceChang. All rights reserved.

//swiftlint:disable comma
//swiftlint:disable line_length
//swiftlint:trailing_comma
//swiftlint:vertical_whitespace

import Foundation
class Database {
    
    static let instance = Database()
    
    private let fitCategories = [
        
        FitnessCategory(title: "全身運動", imageName: "1", secondTitle: "All Workout"),
        FitnessCategory(title: "腹部運動", imageName: "2", secondTitle: "Abs Workout"),
        FitnessCategory(title: "手臂運動", imageName: "4", secondTitle: "Arm Workout"),
        FitnessCategory(title: "腿部運動", imageName: "5", secondTitle: "Leg Workout")
        
    ]
    
    private let coreArray = [
        
        
        ListModel(videoImg: "Abs3", durationLbl: 3, videoTitle: "3分鐘的腹部訓練", videoDescription: "Fitting Room TW", intensity: "入門", videoID: "HjP9GUWTft4", timeRange: TimeRange.max3, actionModel: [
            
            ActionModel(youtubeTime: 10, stopTime: 33, restTime: 3, timesDescription: 30, actionDescription: "登山者", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 43, stopTime: 35, restTime: 3, timesDescription: 30, actionDescription: "捲腹", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 83, stopTime: 35, restTime: 3, timesDescription: 30, actionDescription: "左右棒式滑步", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 122, stopTime: 35, restTime: 3, timesDescription: 30, actionDescription: "V型捲腹", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 163, stopTime: 40, restTime: 3, timesDescription: 30, actionDescription: "棒式小跳", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 204, stopTime: 40, restTime: 3, timesDescription: 30, actionDescription: "全仰臥起坐", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false)
            
            ]),
        
        ListModel(videoImg: "Leg2", durationLbl: 5, videoTitle: "5分鐘在家提臀瘦大腿運動", videoDescription: "周六野 Zoey", intensity: "入門", videoID: "P2MI5A3mo1c", timeRange: TimeRange.threeToNine, actionModel: [
            
            ActionModel(youtubeTime: 70, stopTime: 40, restTime: 3, timesDescription: 30, actionDescription: "15下動作1", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 123, stopTime: 55, restTime: 3, timesDescription: 55, actionDescription: "20下動作2", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 180, stopTime: 38, restTime: 3, timesDescription: 30, actionDescription: "15下動作3", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 226, stopTime: 44, restTime: 3, timesDescription: 40, actionDescription: "左右各15下動作4", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 323, stopTime: 93, restTime: 3, timesDescription: 90, actionDescription: "左右各15下動作5", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false)
            
            ]),
        
        
        ListModel(videoImg: "Leg1", durationLbl: 7, videoTitle: "特快瘦大腿1個月內見效", videoDescription: "Coffee林芊妤" , intensity: "入門", videoID: "3X1PL7ym04I", timeRange: TimeRange.threeToNine, actionModel: [
            
            ActionModel(youtubeTime: 67, stopTime: 60, restTime: 10, timesDescription: 50, actionDescription: "左右20次", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 140, stopTime: 60, restTime: 10, timesDescription: 50, actionDescription: "左右20次", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 214, stopTime: 60, restTime: 10, timesDescription: 50, actionDescription: "升起20次", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 279, stopTime: 60, restTime: 10, timesDescription: 50, actionDescription: "升起20次", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 353, stopTime: 60, restTime: 10, timesDescription: 50, actionDescription: "升起20次", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 438, stopTime: 60, restTime: 10, timesDescription: 50, actionDescription: "升起20次", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 438, stopTime: 60, restTime: 10, timesDescription: 50, actionDescription: "畫圈20次﻿", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false)
            
            ]),
        
        ListModel(videoImg: "Abs1", durationLbl: 7, videoTitle: "連續22天的腹肌訓練計畫", videoDescription: "FittingRoomTW", intensity: "入門", videoID: "EIoryEvS2Gc", timeRange: TimeRange.threeToNine, actionModel: [
            
            ActionModel(youtubeTime: 115.0, stopTime: 30, restTime: 30, timesDescription: 45, actionDescription: "仰臥抬腿", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 164.0, stopTime: 20.0, restTime: 30, timesDescription: 45, actionDescription: "側步棒式", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 200.0, stopTime: 20.0, restTime: 30, timesDescription: 40.0, actionDescription: "12次X卷腹", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 233.0, stopTime: 37.0, restTime: 30, timesDescription: 40.0, actionDescription: "10次左側旋轉側棒式", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 233.0, stopTime: 37.0, restTime: 30, timesDescription: 40.0, actionDescription: "10次右側旋轉側棒式", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 289.0, stopTime: 23.0, restTime: 30, timesDescription: 45.0, actionDescription: "屈體", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 330.0, stopTime: 330.0, restTime: 30, timesDescription: 30, actionDescription: "固定單車式捲腹", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false)
            
            ]),
        
        ListModel(videoImg: "Leg4", durationLbl: 3, videoTitle: "3個動作練翹臀，女生超級需要", videoDescription: "美女健身聯盟", intensity: "入門", videoID: "P_oM739xlnM", timeRange: TimeRange.max3, actionModel: [
            
            ActionModel(youtubeTime: 0, stopTime: 12, restTime: 20, timesDescription: 40, actionDescription: "動作1"),
            
            ActionModel(youtubeTime: 13, stopTime: 17, restTime: 20, timesDescription: 40, actionDescription: "動作2"),
            
            ActionModel(youtubeTime: 30, stopTime: 14, restTime: 20, timesDescription: 40, actionDescription: "動作3")
            
            ]) ,
        
        ListModel(videoImg: "Arm4", durationLbl: 5, videoTitle: "5分鐘的手臂訓練", videoDescription: "Fitting Room TW", intensity: "中等", videoID: "GH2Ezj9zCUU", timeRange: TimeRange.threeToNine, actionModel: [
            
            ActionModel(youtubeTime: 30, stopTime: 70, restTime: 3, timesDescription: 60, actionDescription: "二頭彎舉"),
            
            ActionModel(youtubeTime: 89, stopTime: 70, restTime: 3, timesDescription: 60, actionDescription: "反向飛鳥"),
            
            ActionModel(youtubeTime: 149, stopTime: 70, restTime: 3, timesDescription: 60, actionDescription: "三頭肌動作"),
            
            ActionModel(youtubeTime: 208, stopTime: 70, restTime: 3, timesDescription: 60, actionDescription: "胸肌肩膀動作"),
            
            ActionModel(youtubeTime: 268, stopTime: 70, restTime: 3, timesDescription: 60, actionDescription: "進階三頭肌動作"),
            
            ]),
        
        ListModel(videoImg: "Leg3", durationLbl: 3, videoTitle: "3個簡單動作，快速瘦腿，女生家庭瘦腿", videoDescription: "NINA宅妹", intensity: "入門", videoID: "PLK2XEX38v0", timeRange: TimeRange.max3, actionModel: [
            
            ActionModel(youtubeTime: 44, stopTime: 50, restTime: 3, timesDescription: 40, actionDescription: "開合跳30次"),
            
            ActionModel(youtubeTime: 87, stopTime: 40, restTime: 3, timesDescription: 30, actionDescription: "相撲深蹲15次"),
            
            ActionModel(youtubeTime: 131, stopTime: 40, restTime: 3, timesDescription: 30, actionDescription: "側臥內抬腿左側15次"),
            
            ActionModel(youtubeTime: 131, stopTime: 40, restTime: 3, timesDescription: 30, actionDescription: "側臥內抬腿右側15次"),
            
            ]),
        
        
        ListModel(videoImg: "Arm3", durationLbl: 2, videoTitle: "5分鐘在家瘦手臂運動，甩掉拜拜肉顯鎖骨", videoDescription: "周六野 Zoey", intensity: "入門", videoID: "uVUceueG3Ws", timeRange: TimeRange.max3, actionModel: [
            
            ActionModel(youtubeTime: 90, stopTime: 18, restTime: 3, timesDescription: 60, actionDescription: "超人動作", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 150, stopTime: 25, restTime: 3, timesDescription: 60, actionDescription: "元寶動作往前", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 150, stopTime: 25, restTime: 3, timesDescription: 60, actionDescription: "元寶動作往後", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 215, stopTime: 20, restTime: 3, timesDescription: 60, actionDescription: "滑水動作", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 294, stopTime: 25, restTime: 3, timesDescription: 60, actionDescription: "拳擊動作", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false)
            
            ]),
        
        ListModel(videoImg: "Arm2", durationLbl: 5, videoTitle: "瘦手臂運動無工具坐著完成", videoDescription: "周六野Zoey", intensity: "入門", videoID: "Guq_bB4otbU", timeRange: TimeRange.threeToNine, actionModel: [
            
            ActionModel(youtubeTime: 61, stopTime: 40, restTime: 3, timesDescription: 30, actionDescription: "參拜將軍", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 102, stopTime: 40, restTime: 3, timesDescription: 30, actionDescription: "參拜大人", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 142, stopTime: 40, restTime: 3, timesDescription: 30, actionDescription: "參拜時卡住了", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 197, stopTime: 40, restTime: 3, timesDescription: 30, actionDescription: "參拜皇上", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 246, stopTime: 40, restTime: 3, timesDescription: 30, actionDescription: "參拜大神", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 298, stopTime: 40, restTime: 3, timesDescription: 30, actionDescription: "開窗戶", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 343, stopTime: 40, restTime: 3, timesDescription: 30, actionDescription: "開落地窗", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 384, stopTime: 40, restTime: 3, timesDescription: 30, actionDescription: "仙女氣功", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 441, stopTime: 40, restTime: 3, timesDescription: 30, actionDescription: "仙女攪拌器", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 487, stopTime: 40, restTime: 3, timesDescription: 30, actionDescription: "不知道叫什麼了", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false)
            
            ]),
        
        ListModel(videoImg: "Abs2", durationLbl: 2, videoTitle: "練腹肌人魚線 每天100秒", videoDescription: "洪宏星", intensity: "入門", videoID: "C2dNl_xI7TU", timeRange: TimeRange.max3, actionModel: [
            
            ActionModel(youtubeTime: 15, stopTime: 35, restTime: 3, timesDescription: 35, actionDescription: "動作1", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 51, stopTime: 20, restTime: 3, timesDescription: 20, actionDescription: "動作2", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 70, stopTime: 35, restTime: 3, timesDescription: 35, actionDescription: "動作3", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false)
            
            ]) ,
        
        ]
    
    private let absArray = [
        
        ListModel(videoImg: "Abs3", durationLbl: 3, videoTitle: "3分鐘的腹部訓練", videoDescription: "Fitting Room TW", intensity: "入門", videoID: "HjP9GUWTft4", timeRange: TimeRange.max3, actionModel: [
            
            ActionModel(youtubeTime: 10, stopTime: 30, restTime: 3, timesDescription: 30, actionDescription: "登山者", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 43, stopTime: 35, restTime: 3, timesDescription: 30, actionDescription: "捲腹", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 83, stopTime: 35, restTime: 3, timesDescription: 30, actionDescription: "左右棒式滑步", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 122, stopTime: 35, restTime: 3, timesDescription: 30, actionDescription: "V型捲腹", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 163, stopTime: 37, restTime: 3, timesDescription: 30, actionDescription: "棒式小跳", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 204, stopTime: 40, restTime: 3, timesDescription: 30, actionDescription: "全仰臥起坐", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false)
            
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
        
        ListModel(videoImg: "Abs2", durationLbl: 2, videoTitle: "練腹肌人魚線 每天100秒", videoDescription: "洪宏星", intensity: "入門", videoID: "C2dNl_xI7TU", timeRange: TimeRange.max3, actionModel: [
            
            ActionModel(youtubeTime: 15, stopTime: 35, restTime: 3, timesDescription: 35, actionDescription: "動作1", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 51, stopTime: 20, restTime: 3, timesDescription: 20, actionDescription: "動作2", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 70, stopTime: 35, restTime: 3, timesDescription: 35, actionDescription: "動作3", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false)
            
            ])
        
    ]
    
    private let armArray = [
        ListModel(videoImg: "Arm4", durationLbl: 5, videoTitle: "5分鐘的手臂訓練", videoDescription: "Fitting Room TW", intensity: "中等", videoID: "GH2Ezj9zCUU", timeRange: TimeRange.threeToNine, actionModel: [
            
            ActionModel(youtubeTime: 30, stopTime: 70, restTime: 3, timesDescription: 60, actionDescription: "二頭彎舉"),
            
            ActionModel(youtubeTime: 89, stopTime: 70, restTime: 3, timesDescription: 60, actionDescription: "反向飛鳥"),
            
            ActionModel(youtubeTime: 149, stopTime: 70, restTime: 3, timesDescription: 60, actionDescription: "三頭肌動作"),
            
            ActionModel(youtubeTime: 208, stopTime: 70, restTime: 3, timesDescription: 60, actionDescription: "胸肌肩膀動作"),
            
            ActionModel(youtubeTime: 268, stopTime: 70, restTime: 3, timesDescription: 60, actionDescription: "進階三頭肌動作"),
            
            ]),
        
        ListModel(videoImg: "Arm3", durationLbl: 2, videoTitle: "5分鐘在家瘦手臂運動，甩掉拜拜肉顯鎖骨", videoDescription: "周六野 Zoey", intensity: "入門", videoID: "uVUceueG3Ws", timeRange: TimeRange.max3, actionModel: [
            
            ActionModel(youtubeTime: 81, stopTime: 30, restTime: 3, timesDescription: 20, actionDescription: "超人動作", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 153, stopTime: 40, restTime: 3, timesDescription: 20, actionDescription: "元寶動作", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 215, stopTime: 3, restTime: 30, timesDescription: 20, actionDescription: "滑水動作", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 294, stopTime: 30, restTime: 3, timesDescription: 20, actionDescription: "拳擊動作", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false)
            
            ]),
        
        ListModel(videoImg: "Arm2", durationLbl: 5, videoTitle: "瘦手臂運動無工具坐著完成", videoDescription: "周六野Zoey", intensity: "入門", videoID: "Guq_bB4otbU", timeRange: TimeRange.threeToNine, actionModel: [
            
            ActionModel(youtubeTime: 61, stopTime: 40, restTime: 3, timesDescription: 30, actionDescription: "參拜將軍", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 102, stopTime: 40, restTime: 3, timesDescription: 30, actionDescription: "參拜大人", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 142, stopTime: 40, restTime: 3, timesDescription: 30, actionDescription: "參拜時卡住了", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 197, stopTime: 40, restTime: 3, timesDescription: 30, actionDescription: "參拜皇上", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 246, stopTime: 40, restTime: 3, timesDescription: 30, actionDescription: "參拜大神", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 298, stopTime: 40, restTime: 3, timesDescription: 30, actionDescription: "開窗戶", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 343, stopTime: 40, restTime: 3, timesDescription: 30, actionDescription: "開落地窗", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 384, stopTime: 40, restTime: 3, timesDescription: 30, actionDescription: "仙女氣功", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 441, stopTime: 40, restTime: 3, timesDescription: 30, actionDescription: "仙女攪拌器", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 487, stopTime: 40, restTime: 3, timesDescription: 30, actionDescription: "不知道叫什麼了", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false)
            
            ]),
        
        
        ]
    
    private let legArray = [
        
        ListModel(videoImg: "Leg3", durationLbl: 3, videoTitle: "3個簡單動作，快速瘦腿，女生家庭瘦腿", videoDescription: "NINA宅妹", intensity: "入門", videoID: "PLK2XEX38v0", timeRange: TimeRange.max3, actionModel: [
            
            ActionModel(youtubeTime: 44, stopTime: 50, restTime: 3, timesDescription: 40, actionDescription: "開合跳30次"),
            
            ActionModel(youtubeTime: 87, stopTime: 40, restTime: 3, timesDescription: 30, actionDescription: "相撲深蹲15次"),
            
            ActionModel(youtubeTime: 131, stopTime: 40, restTime: 3, timesDescription: 30, actionDescription: "側臥內抬腿左側15次"),
            
            ActionModel(youtubeTime: 131, stopTime: 40, restTime: 3, timesDescription: 30, actionDescription: "側臥內抬腿右側15次"),
            
            
            ]),
        
        ListModel(videoImg: "Leg2", durationLbl: 5, videoTitle: "5分鐘在家提臀瘦大腿運動", videoDescription: "周六野 Zoey", intensity: "入門", videoID: "P2MI5A3mo1c", timeRange: TimeRange.threeToNine, actionModel: [
            
            ActionModel(youtubeTime: 70, stopTime: 40, restTime: 3, timesDescription: 30, actionDescription: "15下動作1", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 123, stopTime: 55, restTime: 3, timesDescription: 55, actionDescription: "20下動作2", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 180, stopTime: 38, restTime: 3, timesDescription: 40, actionDescription: "15下動作3", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 226, stopTime: 44, restTime: 3, timesDescription: 40, actionDescription: "左右各15下動作4", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 323, stopTime: 93, restTime: 3, timesDescription: 90, actionDescription: "左右各15下動作5", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false)
            
            ]),
        
        ListModel(videoImg: "Leg1", durationLbl: 7, videoTitle: "特快瘦大腿1個月內見效", videoDescription: "Coffee林芊妤" , intensity: "入門", videoID: "3X1PL7ym04I", timeRange: TimeRange.threeToNine, actionModel: [
            
            ActionModel(youtubeTime: 67, stopTime: 60, restTime: 10, timesDescription: 50, actionDescription: "左右20次", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 140, stopTime: 60, restTime: 10, timesDescription: 50, actionDescription: "左右20次", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 214, stopTime: 60, restTime: 10, timesDescription: 50, actionDescription: "升起20次", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 279, stopTime: 60, restTime: 10, timesDescription: 50, actionDescription: "升起20次", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 353, stopTime: 60, restTime: 10, timesDescription: 50, actionDescription: "升起20次", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 438, stopTime: 60, restTime: 10, timesDescription: 50, actionDescription: "升起20次", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false),
            
            ActionModel(youtubeTime: 438, stopTime: 60, restTime: 10, timesDescription: 50, actionDescription: "畫圈20次﻿", cellStatus: CellStatus.willplay, actionOrRest: ActionOrRest.action, playingOrPause: PlayingOrPause.playing, firstPlayAction: true, firstPlayRest: true, actionCellDidInvisiable: false, restCellDidInvisiable: false)
            
            ]),
        
        ListModel(videoImg: "Leg4", durationLbl: 3, videoTitle: "3個動作練翹臀，女生超級需要", videoDescription: "美女健身聯盟", intensity: "入門", videoID: "P_oM739xlnM", timeRange: TimeRange.max3, actionModel: [
            
            ActionModel(youtubeTime: 0, stopTime: 12, restTime: 1, timesDescription: 40, actionDescription: "動作1"),
            
            ActionModel(youtubeTime: 13, stopTime: 17, restTime: 1, timesDescription: 40, actionDescription: "動作2"),
            
            ActionModel(youtubeTime: 30, stopTime: 14, restTime: 1, timesDescription: 40, actionDescription: "動作3")
            
            ]) ,
        
        
        ]
    
    private let scoreArray = [
        ScoreModel(scoreImg: "score_1", titleLbl: "輕鬆"),ScoreModel(scoreImg: "score_2", titleLbl: "適中"),ScoreModel(scoreImg: "score_3", titleLbl: "挑戰級"),ScoreModel(scoreImg: "score_4", titleLbl: "極為吃力")
    ]
    
    private let settingArray = [
        
        SettingModel(titleLbl: "關於 Moving", statusLbl: ""),
        SettingModel(titleLbl: "意見回饋", statusLbl: ""),
        SettingModel(titleLbl: "評分鼓勵", statusLbl: ""),
        SettingModel(titleLbl: "每日運動推播", statusLbl: "尚未設定")
        
    ]
    
    private let settingSwitchArray = [
        
        SettingSwitchModel(titleLbl: "提示音設定", statusSwitch: false),
        SettingSwitchModel(titleLbl: "Apple Health", statusSwitch: false)
        
    ]
    
    private let workout = [ListModel]()
    
    func getfitCategories() -> [FitnessCategory] {
        return fitCategories
    }
    
    func getList(forListTitle title: String) -> [ListModel] {
        switch title {
        case "Core Workout":
            return getCore()
        case "Abs Workout":
            return getAbs()
        case "Arm Workout":
            return getArm()
        case "Leg Workout":
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
