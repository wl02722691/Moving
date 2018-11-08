//
//  NotificationAuthProtocal.swift
//  Moving
//
//  Created by 張書涵 on 2018/11/1.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import Foundation
import UserNotifications

protocol NotificationAuthProtocol {
    
    func notificationVCSwitch()
    
}

extension NotificationAuthProtocol where Self: UIViewController {
    
    func notificationVCSwitch() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let beforeNotificationVC = storyboard.instantiateViewController(
            withIdentifier: "BeforeNotificationVC") as? BeforeNotificationVC else {return}
        
        guard let notificationVC = storyboard.instantiateViewController(
            withIdentifier: "NotificationVC") as? NotificationVC else {return}
        
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            DispatchQueue.main.async {
                
                if settings.authorizationStatus == .authorized {
                    
                    self.show(notificationVC, sender: nil)
                    
                } else {
                    
                    self.show(beforeNotificationVC, sender: nil)
                    
                }
            }
        }
    }
    
}
