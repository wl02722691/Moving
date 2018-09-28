//
//  AppDelegate.swift
//  Fitness-Lab
//
//  Created by 張書涵 on 2018/9/19.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        UIApplication.shared.statusBarStyle = .lightContent
        print(Realm.Configuration.defaultConfiguration.fileURL)
        
        let summary = SummaryModel()
        summary.durationLbl = "Alice"
        summary.scoreTitleLbl = "Alice"
        summary.workoutDate = Date().timeIntervalSince1970
        summary.videoImg = "Alice"
        summary.videoTitle = "Alicee"
        
        do{
            let realm = try Realm()
            try realm.write {
                 realm.add(summary)
            }
        }catch{
            print("Error initalisting new realm, \(error)")
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {}

}
