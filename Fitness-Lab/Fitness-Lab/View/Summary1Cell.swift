//
//  Summary1Cell.swift
//  Fitness-Lab
//
//  Created by 張書涵 on 2018/9/27.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import UIKit

class Summary1Cell: UITableViewCell {

    @IBOutlet weak var planNumberLbl: UILabel!
    @IBOutlet weak var allTimeLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateView() {
        
    }
}
