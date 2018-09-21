//
//  FitnessCell.swift
//  Fitness-Lab
//
//  Created by 張書涵 on 2018/9/20.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import UIKit

class FitnessCell: UITableViewCell {

    @IBOutlet weak var secondFitnessLbl: UILabel!
    @IBOutlet weak var backgroundCardView: UIView!
    @IBOutlet weak var fitnessImg: UIImageView!
    @IBOutlet weak var fitnessLbl: UILabel!
    
    func updataViews(fitnessCategory: FitnessCategory) {
        fitnessImg.image = UIImage(named: fitnessCategory.imageName)
        fitnessLbl.text = fitnessCategory.title
        secondFitnessLbl.text = fitnessCategory.secondTitle
        fitnessImg.clipsToBounds = true
        fitnessImg.layer.cornerRadius = 15
        backgroundCardView.backgroundColor = UIColor.blue
        backgroundCardView.clipsToBounds = true
        backgroundCardView.layer.masksToBounds = false
        backgroundCardView.layer.cornerRadius = 15
        backgroundCardView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        backgroundCardView.layer.shadowOffset = CGSize(width: 15, height: 15)
        backgroundCardView.layer.shadowOpacity = 0.8
        contentView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

    }
}
