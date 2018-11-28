//
//  FitnessCellModel.swift
//  Fitness-Lab
//
//  Created by 張書涵 on 2018/10/2.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import Foundation

struct FitnessCellModel {
    
    let imageName: String
    let title: String
    let subTitle: String
    
    init(category: FitnessModel) {
        
        self.imageName = category.imageName
        self.title = category.title
        self.subTitle = category.secondTitle
    
    }
    
}
