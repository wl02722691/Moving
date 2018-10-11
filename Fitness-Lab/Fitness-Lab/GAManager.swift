//
//  GAManager.swift
//  Fitness-Lab
//
//  Created by 張書涵 on 2018/10/11.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import Foundation

class GAManager {
   
    static func createNormalScreenEventWith(_ screenName: String) {
        let tracker = GAI.sharedInstance().tracker(withTrackingId: AppDelegate.trackId)
        tracker?.set(screenName, value: screenName)
        guard let builder = GAIDictionaryBuilder.createScreenView() else { return }
        tracker?.send(builder.build() as [NSObject: AnyObject])
    }

}
