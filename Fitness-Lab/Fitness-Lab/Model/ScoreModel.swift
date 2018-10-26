//
//  ScoreModel.swift
//  Fitness-Lab
//
//  Created by 張書涵 on 2018/9/26.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import Foundation
struct ScoreModel {
    
    private(set) public var scoreImg: String
    private(set) public var titleLbl: String
    
    init(scoreImg: String,
         titleLbl: String) {
        
        self.scoreImg = scoreImg
        self.titleLbl = titleLbl
    }
    
}
