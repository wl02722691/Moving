//
//  SummaryCellModel.swift
//  Moving
//
//  Created by 張書涵 on 2018/11/5.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import Foundation

struct SettingCellModel {
    
    private(set) public var titleLbl: String
    private(set) public var statusLbl: String
    
    init(settingModel: SettingModel) {
        
        self.titleLbl = settingModel.titleLbl
        self.statusLbl = settingModel.statusLbl
        
    }
    
}
