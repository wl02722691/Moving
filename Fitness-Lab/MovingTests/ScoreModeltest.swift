//
//  ScoreModeltest.swift
//  MovingTests
//
//  Created by 張書涵 on 2018/10/30.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import XCTest
@testable import Moving

class ScoreModeltest: XCTestCase {
    
    func test_ScoreModel() {
        
        let scoreImg = "scoreImg"
        let titleLbl = "titleLbl"
        let scoreModel = ScoreModel(scoreImg: scoreImg, titleLbl: titleLbl)
        
        XCTAssertEqual(scoreModel.scoreImg, scoreImg)
        XCTAssertEqual(scoreModel.titleLbl, titleLbl)
        
    }
    
}
