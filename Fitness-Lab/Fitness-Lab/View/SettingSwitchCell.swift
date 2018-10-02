//
//  SettingSwitchCell.swift
//  Fitness-Lab
//
//  Created by 張書涵 on 2018/10/1.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import UIKit

class SettingSwitchCell: UITableViewCell {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var statusSwitch: UISwitch!
    
    func updateView(settingModel:SettingSwitchModel) {
        titleLbl.text = settingModel.titleLbl
        statusSwitch.isOn = settingModel.statusSwitch
    }
    
}
