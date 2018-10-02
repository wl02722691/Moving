//
//  AppDelegate.swift
//  Fitness-Lab
//
//  Created by 張書涵 on 2018/9/19.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import UIKit
import RealmSwift
import UserNotifications
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        UIApplication.shared.statusBarStyle = .lightContent
        print(Realm.Configuration.defaultConfiguration.fileURL)
        
//        let summary = SummaryModel()
//        summary.durationLbl = 132
//        summary.scoreTitleLbl = "困難"
//        summary.workoutDate = Date().timeIntervalSince1970
//        summary.videoImg = "Abs3"
//        summary.videoTitle = "連續22天的腹肌訓練計畫"
//
//        do{
//            let realm = try Realm()
//            try realm.write {
//                 realm.add(summary)
//            }
//        }catch{
//            print("Error initalisting new realm, \(error)")
//        }
//
//        let notificationCenter = UNUserNotificationCenter.current()
//        notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
//
//        }
        
        IQKeyboardManager.shared.enable = true
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {}

}
