//
//  ActionCellModel.swift
//  Moving
//
//  Created by 張書涵 on 2018/11/5.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import Foundation

struct ActionCellModel {
    
    private(set) public var youtubeTime: Double
    private(set) public var stopTime: Double
    private(set) public var timesDescription: Double
    private(set) public var actionDescription: String
    private(set) public var restTime: Double
    private(set) public var cellStatus: CellStatus
    private(set) public var actionOrRest: ActionOrRest
    private(set) public var playingOrPause: PlayingOrPause
    private(set) public var firstPlayAction: Bool = true
    private(set) public var firstPlayRest: Bool = true
    private(set) public var actionCellDidInvisiable: Bool = false
    private(set) public var restCellDidInvisiable: Bool = false
    
    init(actionModel: NewActionModel) {
        
        self.youtubeTime = actionModel.youtubeTime
        self.stopTime = actionModel.stopTime
        self.timesDescription = actionModel.timesDescription
        self.actionDescription = actionModel.actionDescription
        self.restTime = actionModel.restTime
        self.cellStatus = actionModel.cellStatus
        self.actionOrRest = actionModel.actionOrRest
        self.playingOrPause = actionModel.playingOrPause
        self.firstPlayAction = actionModel.firstPlayAction
        self.firstPlayRest = actionModel.firstPlayRest
        self.actionCellDidInvisiable = actionModel.actionCellDidInvisiable
        self.restCellDidInvisiable = actionModel.restCellDidInvisiable
        
    }
    
}
