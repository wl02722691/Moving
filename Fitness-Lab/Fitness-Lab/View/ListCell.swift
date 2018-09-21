//
//  ListCell.swift
//  Fitness-Lab
//
//  Created by 張書涵 on 2018/9/20.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {
    @IBOutlet weak var videoImg: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var videoDescription: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    @IBOutlet weak var intensityLbl: UILabel!
    
    func updateView(listModel: ListModel) {
        videoImg.image = UIImage(named: listModel.videoImg)
        videoTitle.text = listModel.videoTitle
        videoDescription.text = listModel.videoDescription
        durationLbl.text = "\(listModel.durationLbl)min"
        intensityLbl.text = listModel.intensity
    }
}
