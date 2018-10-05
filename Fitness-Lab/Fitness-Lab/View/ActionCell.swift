//
//  ActionCell.swift
//  Fitness-Lab
//
//  Created by 張書涵 on 2018/9/21.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import UIKit

class ActionCell: UITableViewCell {


    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var timeDescription: UILabel!
    @IBOutlet weak var actionDescription: UILabel!
    
    func updateView(actionModel: ActionModel) {
        progressView.isHidden = true
        timeDescription.text = String("\(Int(actionModel.timesDescription))秒這裡歐")
        actionDescription.text = actionModel.actionDescription
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.backgroundColor = #colorLiteral(red: 0.09411764706, green: 0.09411764706, blue: 0.09411764706, alpha: 1)
    }

}
