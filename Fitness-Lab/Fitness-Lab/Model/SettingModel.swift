//
//  SettingModel.swift
//  Fitness-Lab
//
//  Created by 張書涵 on 2018/9/30.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import Foundation

struct SettingModel {
    
    private(set) public var titleLbl: String
    private(set) public var statusLbl: String

    init(titleLbl: String,
         statusLbl: String) {
        
        self.titleLbl = titleLbl
        self.statusLbl = statusLbl
        
    }
    
}
