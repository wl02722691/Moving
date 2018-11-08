//
//  SettingCell.swift
//  Fitness-Lab
//
//  Created by 張書涵 on 2018/9/30.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import UIKit

class SettingCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    
    func updateView(settingModel: SettingCellModel) {
        
        titleLbl.text = settingModel.titleLbl
        
        statusLbl.text = settingModel.statusLbl
        
    }
    
}
