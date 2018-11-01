//
//  SettingSwitchModel.swift
//  MovingTests
//
//  Created by 張書涵 on 2018/10/30.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import XCTest
@testable import Moving

class SettingSwitchModeltest: XCTestCase {
    
    func test_SettingSwitchModel() {
        
        let titleLbl = "titleLbl"
        let statusSwitch = true
        
        let settingSwitchModel = SettingSwitchModel(titleLbl: titleLbl, statusSwitch: statusSwitch)
        
        XCTAssertEqual(settingSwitchModel.titleLbl, titleLbl)
        XCTAssertEqual(settingSwitchModel.statusSwitch, statusSwitch)
    }
    
}
