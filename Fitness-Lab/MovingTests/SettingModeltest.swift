//
//  SettingModeltest.swift
//  MovingTests
//
//  Created by 張書涵 on 2018/10/30.
//  Copyright © 2018年 AliceChang. All rights reserved.
//
import XCTest
@testable import Moving

class SettingModeltest: XCTestCase {
    
    func test_SettingModeltest() {
        
        let titleLbl = "titleLbl"
        let statusLbl = "statusLbl"
        
        let settingMode = SettingModel(titleLbl: titleLbl, statusLbl: statusLbl)
        
        XCTAssertEqual(settingMode.titleLbl, titleLbl)
        XCTAssertEqual(settingMode.statusLbl, statusLbl)
        
    }
    
}
