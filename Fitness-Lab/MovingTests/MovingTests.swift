//
//  MovingTests.swift
//  MovingTests
//
//  Created by 張書涵 on 2018/10/30.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import XCTest
@testable import Moving


class MovingTests: XCTestCase {

    
    func testSquare() {
        let value = 3
        let squaredValue = value.square()
        
        
        XCTAssertEqual(squaredValue, 9)
    }
    
    func testHelloWorld() {
        var helloWorld: String?
        
        XCTAssertNil(helloWorld)
        
        helloWorld = "hello world"
        XCTAssertEqual(helloWorld, "hello world1")
    }

}
