//
//  test_ActionModel.swift
//  MovingTests
//
//  Created by 張書涵 on 2018/10/30.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import XCTest
@testable import Moving

class ActionModeltest: XCTestCase {

    func test_ActionModel() {
        
        let youtubeTime = 1.0
        let stopTime = 1.0
        let restTime = 1.0
        let timesDescription = 1.0
        let actionDescription = "actionDescription"
        let cellStatus = CellStatus.willplay
        let actionOrRest = ActionOrRest.action
        let playingOrPause = PlayingOrPause.playing
        let firstPlayAction = true
        let firstPlayRest = true
        let actionCellDidInvisiable = false
        let restCellDidInvisiable = false
        
        let actionModel = ActionModel(youtubeTime: youtubeTime,
                                      stopTime: stopTime,
                                      restTime: restTime,
                                      timesDescription: timesDescription,
                                      actionDescription: actionDescription,
                                      cellStatus: cellStatus,
                                      actionOrRest: actionOrRest,
                                      playingOrPause: playingOrPause,
                                      firstPlayAction: firstPlayAction,
                                      firstPlayRest: firstPlayRest,
                                      actionCellDidInvisiable: actionCellDidInvisiable,
                                      restCellDidInvisiable: restCellDidInvisiable)
        
        XCTAssertEqual(actionModel.youtubeTime, youtubeTime)
        XCTAssertEqual(actionModel.stopTime, stopTime)
        XCTAssertEqual(actionModel.restTime, restTime)
        XCTAssertEqual(actionModel.timesDescription, timesDescription)
        XCTAssertEqual(actionModel.actionDescription, actionDescription)
        XCTAssertEqual(actionModel.playingOrPause, playingOrPause)
        XCTAssertEqual(actionModel.actionOrRest, actionOrRest)
        XCTAssertEqual(actionModel.playingOrPause, playingOrPause)
        XCTAssertEqual(actionModel.firstPlayAction, firstPlayAction)
        XCTAssertEqual(actionModel.firstPlayRest, firstPlayRest)
        XCTAssertEqual(actionModel.actionCellDidInvisiable, actionCellDidInvisiable)
        XCTAssertEqual(actionModel.restCellDidInvisiable, restCellDidInvisiable)
        
    }
}
