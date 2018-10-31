//
//  SettingSwitchModel.swift
//  Fitness-Lab
//
//  Created by 張書涵 on 2018/10/1.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import Foundation

struct SettingSwitchModel: Codable {
    
    private(set) public var titleLbl: String
    var statusSwitch: Bool
    
    init(titleLbl: String,
         statusSwitch: Bool) {
        
        self.titleLbl = titleLbl
        self.statusSwitch = statusSwitch
        
    }
    
}
