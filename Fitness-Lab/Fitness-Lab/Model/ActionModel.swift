//
//  ActionModel.swift
//  Fitness-Lab
//
//  Created by 張書涵 on 2018/9/21.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import Foundation
struct ActionModel {
    private(set) public var youtubeTime: Double
    private(set) public var stopTime: Double
    private(set) public var timesDescription: Double
    private(set) public var actionDescription: String
    private(set) public var restTime: Double
    public var cellStatus: CellStatus = .willplay
    public var actionOrRest: ActionOrRest = .action
    public var playingOrPause: PlayingOrPause = .playing
    public var firstPlayAction: Bool = true
    public var firstPlayRest: Bool = true
    public var actionCellDidInvisiable: Bool = false
    public var restCellDidInvisiable: Bool = false
    
    init(youtubeTime: Double,
         stopTime: Double,
         restTime: Double,
         timesDescription: Double,
         actionDescription: String,
         cellStatus: CellStatus,
         actionOrRest: ActionOrRest,
         playingOrPause: PlayingOrPause,
         firstPlayAction: Bool,
         firstPlayRest: Bool,
         actionCellDidInvisiable: Bool,
         restCellDidInvisiable: Bool) {
        
        self.youtubeTime = youtubeTime
        self.stopTime = stopTime
        self.timesDescription = timesDescription
        self.actionDescription = actionDescription
        self.restTime = restTime
        self.cellStatus = cellStatus
        self.actionOrRest = actionOrRest
        self.playingOrPause = playingOrPause
        self.firstPlayAction = firstPlayAction
        self.firstPlayRest = firstPlayRest
        self.actionCellDidInvisiable = actionCellDidInvisiable
        self.restCellDidInvisiable = restCellDidInvisiable
    }
}
