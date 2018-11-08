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
import Firebase
import Fabric
import Crashlytics
import GoogleMobileAds

//swiftlint:disable identifier_name
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    static let trackId = "UA-127437353-1"


    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GADMobileAds.configure(withApplicationID: "ca-app-pub-5095539141044986~3361630590")
        
        UIApplication.shared.statusBarStyle = .lightContent
        
        print(Realm.Configuration.defaultConfiguration.fileURL)
        
        IQKeyboardManager.shared.enable = true
        
        FirebaseApp.configure()
        
        guard let gai = GAI.sharedInstance() else {
            assert(false, "Google Analytics not configured correctly")
            return false
        }
        
        gai.tracker(withTrackingId: AppDelegate.trackId)
    
        gai.trackUncaughtExceptions = true
        
        Fabric.with([Crashlytics.self])
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {}

}
