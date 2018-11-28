//
//  NewActionModel.swift
//  Moving
//
//  Created by 張書涵 on 2018/11/27.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import Foundation

struct NewActionModel: Equatable, Codable {
    
    private(set) public var youtubeTime: Double
    private(set) public var stopTime: Double
    private(set) public var timesDescription: Double
    private(set) public var actionDescription: String
    private(set) public var restTime: Double
    public var cellStatus: CellStatus
    public var actionOrRest: ActionOrRest
    public var playingOrPause: PlayingOrPause
    public var firstPlayAction: Bool = true
    public var firstPlayRest: Bool = true
    public var actionCellDidInvisiable: Bool = false
    public var restCellDidInvisiable: Bool = false
    
    init(youtubeTime: Double,
         stopTime: Double,
         restTime: Double,
         timesDescription: Double,
         actionDescription: String,
         cellStatus: CellStatus = CellStatus.willplay,
         actionOrRest: ActionOrRest = ActionOrRest.action,
         playingOrPause: PlayingOrPause = PlayingOrPause.playing,
         firstPlayAction: Bool = true,
         firstPlayRest: Bool = true,
         actionCellDidInvisiable: Bool = false,
         restCellDidInvisiable: Bool = false) {
        
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
