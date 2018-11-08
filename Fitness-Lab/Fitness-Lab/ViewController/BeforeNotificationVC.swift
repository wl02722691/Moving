//
//  BeforeNotificationVC.swift
//  Moving
//
//  Created by 張書涵 on 2018/10/16.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import UIKit
import UserNotifications

class BeforeNotificationVC: UIViewController {
    
    @IBOutlet weak var okBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        okBtn.cornerRadius = 25
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        self.tabBarController?.tabBar.isHidden = true
        viewWillLayoutSubviews()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.tabBarController?.tabBar.isHidden = false
        
    }
    
    func checkAuth() {
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge, .carPlay],
                                                                completionHandler: { (granted, _ ) in
                                                                    if granted {
                                                                        DispatchQueue.main.async {

                                                                            self.performSegue(withIdentifier: "backToNotificationVC",
                                                                                              sender: nil)
                                                                            UserDefaults.standard.set(false,
                                                                                                      forKey: "firstNotification")
                                                                        }

                                                                    } else {

                                                                        let firstNotification = UserDefaults.standard.value(forKey:
                                                                            "firstNotification") as? Bool

                                                                        if firstNotification != nil {

                                                                            DispatchQueue.main.async {
                                                                                UIApplication.shared.open(URL.init(string: UIApplication.openSettingsURLString)!,
                                                                                                          options: [:],
                                                                                                          completionHandler: nil)
                                                                            }
                                                                        } else {
                                                                            DispatchQueue.main.async {

                                                                                self.navigationController?.popToRootViewController(animated: true)
                                                                                UserDefaults.standard.set(false, forKey: "firstNotification")
                                                                            }
                                                                        }}
        })
    }
    
    @IBAction func okBtn(_ sender: UIButton) {
        
        checkAuth()
        
    }
    
    @IBAction func closeBtn(_ sender: UIButton) {
        
        navigationController?.popToRootViewController(animated: true)
        
    }
}
