//
//  Summary2Cell.swift
//  Fitness-Lab
//
//  Created by 張書涵 on 2018/9/27.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import UIKit

class Summary2Cell: UITableViewCell {
    
    @IBOutlet weak var scoreTitleLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var workoutDateLbl: UILabel!
    @IBOutlet weak var videoImg: UIImageView!
    
    func updateView(summaryModel: SummaryModel) {
 
        let minutes = summaryModel.durationLbl % 3600 / 60
        let seconds = (summaryModel.durationLbl % 3600) % 60
        
        scoreTitleLbl.text = summaryModel.scoreTitleLbl
        durationLbl.text = ("\(minutes):\(seconds)")
        videoTitle.text = summaryModel.videoTitle
        workoutDateLbl.text = timeIntervalToString(workoutDate: summaryModel.workoutDate)
        videoImg.image = UIImage(named: summaryModel.videoImg)
      
    }
    
    func timeIntervalToString(workoutDate: TimeInterval) -> String {
        
        let date = Date(timeIntervalSince1970: workoutDate)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "TW")
        dateFormatter.locale = NSLocale.current
        
        dateFormatter.dateFormat = "MM月 dd日 HH:mm"
        let strDate = dateFormatter.string(from: date)
        return strDate
        
    }
    
}
