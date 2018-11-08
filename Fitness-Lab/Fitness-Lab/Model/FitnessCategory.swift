//
//  FitnessCategory.swift
//  Fitness-Lab
//
//  Created by 張書涵 on 2018/9/20.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import Foundation

struct FitnessCategory: Codable {
    
    private(set) public var secondTitle: String!
    private(set) public var title: String!
    private(set) public var imageName: String!
    
    init(title: String, imageName: String, secondTitle: String) {
        
        self.title = title
        self.imageName = imageName
        self.secondTitle = secondTitle
        
    }
    
}
