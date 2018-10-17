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
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        okBtn.cornerRadius = 25
    }
    
    @IBAction func okBtn(_ sender: UIButton) {
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge, .carPlay],
                                                                completionHandler: { (granted, error) in
                                                                    if granted {
                                                                        DispatchQueue.main.async {
                                                                            
                                                                            self.performSegue(withIdentifier: "backToNotificationVC", sender: nil)
                                                                            UserDefaults.standard.set(false, forKey: "firstNotification")
                                                                            
                                                                        }
                                                                        
                                                                    } else {
                                                                        
                                                                        let firstNotification = UserDefaults.standard.value(forKey: "firstNotification") as? Bool
                                                                        
                                                                        if firstNotification != nil {
                                                                            
                                                                            DispatchQueue.main.async {
                                                                                UIApplication.shared.open(URL.init(string: UIApplication.openSettingsURLString)!,
                                                                                                          options: [:], completionHandler: nil)
                                                                                self.okBtn.titleLabel?.text = "連好了嗎～"
                                                                            }
                                                                            
                                                                        } else {
                                                                            DispatchQueue.main.async {
                                                                                self.navigationController?.popToRootViewController(animated: true)
                                                                                UserDefaults.standard.set(false, forKey: "firstNotification")
                                                                            }
                                                                        }
                                                                    }
        }
        )
        
    }
}
