//
//  ActionCell.swift
//  Fitness-Lab
//
//  Created by 張書涵 on 2018/9/21.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import UIKit

class ActionCell: UITableViewCell {

    @IBOutlet weak var timeDescription: UILabel!
    @IBOutlet weak var actionDescription: UILabel!
    
    
    func updateView(actionModel: ActionModel) {
        timeDescription.text = actionModel.timesDescription
        actionDescription.text = actionModel.actionDescription
    }
}
