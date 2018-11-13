//
//  SettingSwitchCellModel.swift
//  Moving
//
//  Created by 張書涵 on 2018/11/5.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import Foundation

struct SettingSwitchCellModel {
    
    private(set) public var titleLbl: String
    private(set) public var statusSwitch: Bool
    
    init(settingSwitchModel: SettingSwitchModel) {
        
        self.titleLbl = settingSwitchModel.titleLbl
        self.statusSwitch = settingSwitchModel.statusSwitch
        
    }
    
}
