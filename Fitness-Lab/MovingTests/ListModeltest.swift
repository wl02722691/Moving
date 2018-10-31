//
//  test_ListModel.swift
//  MovingTests
//
//  Created by 張書涵 on 2018/10/30.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import XCTest
@testable import Moving

class ListModeltest: XCTestCase {
    
    func test_ListModel() {
        
        let videoImg = "videoImg"
        let durationLbl = 10
        let videoTitle = "videoTitle"
        let videoDescription = "videoDescription"
        let intensity = "intensity"
        let videoID = "videoID"
        let timeRange = TimeRange.max3
        let actionModel = [ActionModel(youtubeTime: 60,
                                       stopTime: 50,
                                       restTime: 10,
                                       timesDescription: 25,
                                       actionDescription: "40次動作1",
                                       cellStatus: CellStatus.willplay,
                                       actionOrRest: ActionOrRest.action,
                                       playingOrPause: PlayingOrPause.playing,
                                       firstPlayAction: true,
                                       firstPlayRest: true,
                                       actionCellDidInvisiable: false,
                                       restCellDidInvisiable: false)]
        
        let listModel = ListModel(videoImg: videoImg,
                                  durationLbl: durationLbl,
                                  videoTitle: videoTitle,
                                  videoDescription: videoDescription,
                                  intensity: intensity,
                                  videoID: videoID,
                                  timeRange: timeRange,
                                  actionModel: actionModel)
        
        XCTAssertEqual(listModel.videoImg, videoImg)
        XCTAssertEqual(listModel.durationLbl, durationLbl)
        XCTAssertEqual(listModel.videoTitle, videoTitle)
        XCTAssertEqual(listModel.videoDescription, videoDescription)
        XCTAssertEqual(listModel.intensity, intensity)
        XCTAssertEqual(listModel.videoID, videoID)
        XCTAssertEqual(listModel.timeRange, timeRange)
        XCTAssertEqual(listModel.actionModel, actionModel)
        
    }

}
