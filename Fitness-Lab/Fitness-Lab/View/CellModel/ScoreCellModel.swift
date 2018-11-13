//
//  ScoreCollectionViewCellModel.swift
//  Moving
//
//  Created by 張書涵 on 2018/11/5.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import Foundation

struct ScoreCellModel {
    
    private(set) public var scoreImg: String
    private(set) public var titleLbl: String
    
    init(scoreModel: ScoreModel) {
        
        self.scoreImg = scoreModel.scoreImg
        self.titleLbl = scoreModel.titleLbl
        
    }
    
}
