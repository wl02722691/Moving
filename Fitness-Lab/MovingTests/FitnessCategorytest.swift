//
//  MovingTests.swift
//  MovingTests
//
//  Created by 張書涵 on 2018/10/30.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import XCTest
@testable import Moving

class FitnessCategorytest: XCTestCase {
    
    func test_FitnessCategory() {
        
        let title = "title"
        let imageName = "imageName"
        let secondTitle = "secondTitle"
        let fitnessCategory = FitnessCategory(title: title, imageName: imageName, secondTitle: secondTitle)
        
        XCTAssertEqual(fitnessCategory.title, title)
        XCTAssertEqual(fitnessCategory.imageName, imageName)
        XCTAssertEqual(fitnessCategory.secondTitle, secondTitle)
        
    }
    
}
